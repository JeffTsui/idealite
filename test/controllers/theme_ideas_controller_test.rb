require 'test_helper'

class ThemeIdeasControllerTest < ActionController::TestCase
  setup do
    @theme_idea = theme_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theme_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theme_idea" do
    assert_difference('ThemeIdea.count') do
      post :create, theme_idea: { idea_id: @theme_idea.idea_id, score: @theme_idea.score, theme_id: @theme_idea.theme_id }
    end

    assert_redirected_to theme_idea_path(assigns(:theme_idea))
  end

  test "should show theme_idea" do
    get :show, id: @theme_idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theme_idea
    assert_response :success
  end

  test "should update theme_idea" do
    patch :update, id: @theme_idea, theme_idea: { idea_id: @theme_idea.idea_id, score: @theme_idea.score, theme_id: @theme_idea.theme_id }
    assert_redirected_to theme_idea_path(assigns(:theme_idea))
  end

  test "should destroy theme_idea" do
    assert_difference('ThemeIdea.count', -1) do
      delete :destroy, id: @theme_idea
    end

    assert_redirected_to theme_ideas_path
  end
end
