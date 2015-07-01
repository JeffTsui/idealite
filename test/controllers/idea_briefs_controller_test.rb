require 'test_helper'

class IdeaBriefsControllerTest < ActionController::TestCase
  setup do
    @idea_brief = idea_briefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idea_briefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea_brief" do
    assert_difference('IdeaBrief.count') do
      post :create, idea_brief: { how: @idea_brief.how, problem: @idea_brief.problem, result: @idea_brief.result, risk: @idea_brief.risk, target: @idea_brief.target, title: @idea_brief.title, user_id: @idea_brief.user_id }
    end

    assert_redirected_to idea_brief_path(assigns(:idea_brief))
  end

  test "should show idea_brief" do
    get :show, id: @idea_brief
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea_brief
    assert_response :success
  end

  test "should update idea_brief" do
    patch :update, id: @idea_brief, idea_brief: { how: @idea_brief.how, problem: @idea_brief.problem, result: @idea_brief.result, risk: @idea_brief.risk, target: @idea_brief.target, title: @idea_brief.title, user_id: @idea_brief.user_id }
    assert_redirected_to idea_brief_path(assigns(:idea_brief))
  end

  test "should destroy idea_brief" do
    assert_difference('IdeaBrief.count', -1) do
      delete :destroy, id: @idea_brief
    end

    assert_redirected_to idea_briefs_path
  end
end
