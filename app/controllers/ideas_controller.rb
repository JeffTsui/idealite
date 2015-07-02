class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_idea, only: [:show, :edit, :update, :destroy, 
    :update_teams, :post_actor_id, :save_session_idea]
  before_action :save_session_idea, only: [:show]
  
  respond_to :html, :json

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @teams_admined = Team.teams_admined(current_user.id)
    @idea_teams = @idea.teams
    @post = Post.new
    @post_actor_cat = ["me","team"]
    logger.debug session[:idea_id].inspect.light_blue
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
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

  # GET dropdown list (ajax call)
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
    
    #save current idea to session
    def save_session_idea
      if @idea.is_my_idea?(current_user.id)
        logger.debug "save session idea".light_blue
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
