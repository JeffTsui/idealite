class IdeaTeamsController < ApplicationController
  before_action :set_idea_team, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @idea_teams = IdeaTeam.all
    respond_with(@idea_teams)
  end

  def show
    respond_with(@idea_team)
  end

  def new
    @idea_team = IdeaTeam.new
    respond_with(@idea_team)
  end

  def edit
  end

  def create
    @idea_team = IdeaTeam.new(idea_team_params)
    @idea_team.save
    respond_with(@idea_team)
  end

  def update
    @idea_team.update(idea_team_params)
    respond_with(@idea_team)
  end

  def destroy
    @idea_team.destroy
    respond_with(@idea_team)
  end

  private
    def set_idea_team
      @idea_team = IdeaTeam.find(params[:id])
    end

    def idea_team_params
      params.require(:idea_team).permit(:idea_id, :team_id, :role_id)
    end
end
