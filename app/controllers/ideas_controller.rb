class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_idea, only: [:show, :edit, :update, :destroy, 
    :update_teams, :post_actor_id, :save_session_idea, :like, :detail, :avatar, :aws_update_avatar, 
    :privacy, :link, :finish_survey, :delete_survey]
  before_action :init, only: [:show, :detail, :edit, :avatar, :aws_update_avatar, :link, :team, 
  :new_survey, :attempt]
  
  respond_to :html, :json
  
  include Survey

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @post = Post.new
    @attempt = Attempt.new(survey: @survey, participant: current_user)
    @post_actor_cat = ["me","team"]
    @watched_ideas = Idea.watched_ideas(current_user)
    @new_milestone = Milestone.new    
  end
  
  def detail
    logger.debug "showing idea detail page".light_blue
  end
  
  def avatar
    logger.debug params.inspect.light_blue
    redirect_url = request.protocol + request.host + aws_update_avatar_idea_path
    @uploader = @idea_brief.avatar
    @uploader.success_action_redirect = redirect_url
    logger.debug "saving avatar to S3 and redirect_to #{redirect_url}".light_yellow
  end
  
  def aws_update_avatar
    @idea_brief.update_attribute(:key, params[:key])
    @idea_brief.update_attribute(:image_url, params[:key])
    logger.debug @idea_brief.avatar.inspect.light_yellow
    render "detail"
  end

  #Search for similar ideas of the new claimed idea
  def claim_idea
    @idea_title = params[:text]
    @similar_ideas = Idea.all
    render layout: "similar_ideas"
  end
  
  # GET /ideas/new
  def new
    @idea = Idea.claim_idea(current_user.id, params[:title])
    redirect_to edit_idea_path(@idea)
  end

  # GET /ideas/1/edit
  def edit

  end
  
  #Update Teams
  def update_teams
    logger.debug "update idea teams".light_yellow
    @team_ids = params[:team_ids]
    IdeaTeam.destroy_all(idea_id:@idea.id)
    logger.debug @team_ids.inspect.light_yellow
    if !@team_ids.nil?
      @team_ids.each do |team_id|
        IdeaTeam.create(team_id:team_id, idea_id:@idea.id)
      end
    end
    redirect_to @idea
  end

  # GET dropdown list (ajax call) (not used anymore)
  def post_actor_id
    logger.debug "get dropdown".light_yellow
    @observer_id = params[:observer_id]
    @post_actor_cat = params[:observed_id]
    @options=nil
    @teams=@idea.my_idea_teams(current_user.id)
    if @post_actor_cat == "team"
      @options = @idea.my_idea_teams(current_user.id)
    end
    respond_to do |format|
      format.js
    end
  end
  
  # Like Idea - AJAX call
  def like
    if params[:type] == "like"
      if current_user.likes?(@idea)
        current_user.unlike!(@idea)
      else
        current_user.like!(@idea)
      end
    elsif params[:type] == "follow"
      if current_user.follows?(@idea)
        current_user.unfollow!(@idea)
      else
        current_user.follow!(@idea)
      end
    end
    logger.debug @idea.likers(User).inspect.light_yellow
    respond_to do |format|
      format.js
    end
  end
  
  #Update idea privacy - AJAX call  
  def privacy
    @idea.privacy_flag = params[:value]
    @idea.save
    respond_to do |format|
      format.js
    end
  end

  #Create/Update idea link
  def link
    @link_idea = Idea.find(params[:idea_linked_id])
    IdeaLink.save_pair(@idea.id, params[:idea_linked_id], params[:value], current_user.id)
    respond_to do |format|
      format.js
    end
  end
  
  def team
    @role = UserTeamRole.new  
  end
  
  def new_survey
    s = Survey.new(name: "idea #{@idea.id}", 
      description: @idea.idea_brief.title, attempts_number: 1)
    question = Question.new(text: params[:question])
    params[:options].each do |k,v|
      logger.debug "k = #{k}, v = #{v}"
      (question.options << Option.new(text: v)) if !v.empty?
    end
    s.questions = [question]    
    s.active = true
    s.save!
    IdeaSurvey.create(idea_id: @idea.id, survey_id: s.id)
    redirect_to @idea
  end
  
  def finish_survey
    survey = Survey.find(params[:survey_id])
    survey.update(finished: true)
    redirect_to idea_path(@idea, pane: "poll")
  end
  
  def delete_survey
    Survey.destroy(params[:survey_id])
    redirect_to idea_path(@idea, pane: "poll")
  end
  
  def attempt
    attempt = Attempt.new(survey: @survey, participant: current_user)
    option = Option.find(params[:attempt][:answers][:"#{@survey.primary_question.id}"])
    answer = Answer.new(question: @survey.primary_question, option: option)
    attempt.answers = [answer]
    attempt.save
    logger.debug "answer is #{answer.inspect}".light_yellow
    redirect_to idea_path(@idea, pane: "poll")
  end
  
  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new
    @idea.idea_brief_id = params[:idea_brief_id]

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    #Initialize for idea page
    #save current idea to session
    def init
      set_idea
      @teams_admined = Team.teams_admined(current_user.id)
      @idea_teams = @idea.teams
      @my_idea_teams =  @idea.my_idea_teams(current_user.id)
      @idea_members = @idea.default_team_members
      @idea_brief = @idea.idea_brief
      @idea_team = @idea.default_team
      @survey = @idea.active_survey
      if @idea.is_my_idea?(current_user.id)
        logger.debug "saving current idea #{@idea.id} to session".light_blue
        session[:idea_id] = @idea.id
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      #get idea_id from params or session
      @idea_id = params[:id] ? params[:id] : session[:idea_id]
      @idea = Idea.find(@idea_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:idea_brief_id)
    end
end
