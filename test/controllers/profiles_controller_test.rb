require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { address: @profile.address, birthday: @profile.birthday, city: @profile.city, country: @profile.country, fax: @profile.fax, mobile: @profile.mobile, nickname: @profile.nickname, phone: @profile.phone, profile_id: @profile.profile_id, profile_type: @profile.profile_type, province: @profile.province, website: @profile.website, zipcode: @profile.zipcode }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { address: @profile.address, birthday: @profile.birthday, city: @profile.city, country: @profile.country, fax: @profile.fax, mobile: @profile.mobile, nickname: @profile.nickname, phone: @profile.phone, profile_id: @profile.profile_id, profile_type: @profile.profile_type, province: @profile.province, website: @profile.website, zipcode: @profile.zipcode }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
