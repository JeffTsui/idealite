require 'test_helper'

class PostAsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
