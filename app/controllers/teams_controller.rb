class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  autocomplete :user, :name, :full => true, :extra_data => [:id]

  respond_to :html
  
  def index
    @teams = Team.all
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    logger.debug "Creating team".light_yellow
    @team = Team.create(name: team_params[:name], description: team_params[:description], user_id: current_user.id)
    @user_team = UserTeam.create(user_id: current_user.id, team_id: @team.id, role_id: 0)
    #create pending request
    @team_request = TeamRequest.create(team_id: @team.id, user_id: params[:recepient_ids], requester_id: current_user.id, action: 0)
    #create empty profile
    @team_profile = Profile.create(profile_id: @team.id, profile_type: "Team")
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description, :user_id)
    end

end
