require 'test_helper'

class UserTeamRolesControllerTest < ActionController::TestCase
  setup do
    @user_team_role = user_team_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_team_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_team_role" do
    assert_difference('UserTeamRole.count') do
      post :create, user_team_role: { desc: @user_team_role.desc, open_flag: @user_team_role.open_flag, role: @user_team_role.role, team_id: @user_team_role.team_id }
    end

    assert_redirected_to user_team_role_path(assigns(:user_team_role))
  end

  test "should show user_team_role" do
    get :show, id: @user_team_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_team_role
    assert_response :success
  end

  test "should update user_team_role" do
    patch :update, id: @user_team_role, user_team_role: { desc: @user_team_role.desc, open_flag: @user_team_role.open_flag, role: @user_team_role.role, team_id: @user_team_role.team_id }
    assert_redirected_to user_team_role_path(assigns(:user_team_role))
  end

  test "should destroy user_team_role" do
    assert_difference('UserTeamRole.count', -1) do
      delete :destroy, id: @user_team_role
    end

    assert_redirected_to user_team_roles_path
  end
end
