require 'test_helper'

class IdeaTeamsControllerTest < ActionController::TestCase
  setup do
    @idea_team = idea_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idea_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea_team" do
    assert_difference('IdeaTeam.count') do
      post :create, idea_team: { idea_id: @idea_team.idea_id, role_id: @idea_team.role_id, team_id: @idea_team.team_id }
    end

    assert_redirected_to idea_team_path(assigns(:idea_team))
  end

  test "should show idea_team" do
    get :show, id: @idea_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea_team
    assert_response :success
  end

  test "should update idea_team" do
    patch :update, id: @idea_team, idea_team: { idea_id: @idea_team.idea_id, role_id: @idea_team.role_id, team_id: @idea_team.team_id }
    assert_redirected_to idea_team_path(assigns(:idea_team))
  end

  test "should destroy idea_team" do
    assert_difference('IdeaTeam.count', -1) do
      delete :destroy, id: @idea_team
    end

    assert_redirected_to idea_teams_path
  end
end
