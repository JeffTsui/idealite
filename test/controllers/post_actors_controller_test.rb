require 'test_helper'

class PostActorsControllerTest < ActionController::TestCase
  setup do
    @post_actor = post_actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_actor" do
    assert_difference('PostActor.count') do
      post :create, post_actor: { post_actor_id: @post_actor.post_actor_id, post_actor_type: @post_actor.post_actor_type, post_id: @post_actor.post_id }
    end

    assert_redirected_to post_actor_path(assigns(:post_actor))
  end

  test "should show post_actor" do
    get :show, id: @post_actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_actor
    assert_response :success
  end

  test "should update post_actor" do
    patch :update, id: @post_actor, post_actor: { post_actor_id: @post_actor.post_actor_id, post_actor_type: @post_actor.post_actor_type, post_id: @post_actor.post_id }
    assert_redirected_to post_actor_path(assigns(:post_actor))
  end

  test "should destroy post_actor" do
    assert_difference('PostActor.count', -1) do
      delete :destroy, id: @post_actor
    end

    assert_redirected_to post_actors_path
  end
end
