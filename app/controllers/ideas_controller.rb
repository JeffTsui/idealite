class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :update_teams]

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
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:idea_brief_id)
    end
end
