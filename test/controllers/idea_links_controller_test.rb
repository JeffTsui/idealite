require 'test_helper'

class IdeaLinksControllerTest < ActionController::TestCase
  setup do
    @idea_link = idea_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idea_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea_link" do
    assert_difference('IdeaLink.count') do
      post :create, idea_link: { idea_source_id: @idea_link.idea_source_id, idea_target_id: @idea_link.idea_target_id, user_id: @idea_link.user_id }
    end

    assert_redirected_to idea_link_path(assigns(:idea_link))
  end

  test "should show idea_link" do
    get :show, id: @idea_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea_link
    assert_response :success
  end

  test "should update idea_link" do
    patch :update, id: @idea_link, idea_link: { idea_source_id: @idea_link.idea_source_id, idea_target_id: @idea_link.idea_target_id, user_id: @idea_link.user_id }
    assert_redirected_to idea_link_path(assigns(:idea_link))
  end

  test "should destroy idea_link" do
    assert_difference('IdeaLink.count', -1) do
      delete :destroy, id: @idea_link
    end

    assert_redirected_to idea_links_path
  end
end
