class UserTeamRolesController < ApplicationController
  before_action :user_team_role_params, only: [:show, :edit, :update, :destroy, :create]
  before_action :set_user_team_role

  respond_to :html

  def index
    @user_team_roles = UserTeamRole.all
    respond_with(@user_team_roles)
  end

  def show
    respond_with(@user_team_role)
  end

  def new
    @user_team_role = UserTeamRole.new
    respond_with(@user_team_role)
  end

  def edit
  end
  
  def apply
    TeamRequest.toggle_apply(params[:team_id], @user_team_role.id, current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def create
    @idea = Idea.find(params[:user_team_role][:idea_id])
    @user_team_role = UserTeamRole.new(user_team_role_params)
    @user_team_role.open_flag = true
    @user_team_role.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @user_team_role.update(user_team_role_params)
    respond_with(@user_team_role)
  end

  def destroy
    @user_team_role.destroy
    respond_with(@user_team_role)
  end

  private
    def set_user_team_role
      @user_team_role = UserTeamRole.find(params[:id])
    end

    def user_team_role_params
      params.require(:user_team_role).permit(:team_id, :role_id, :role_name, 
        :desc, :open_flag, :open_number)
    end
    
    def init
      user_team_role_params
    end
end
