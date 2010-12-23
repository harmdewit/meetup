require 'test_helper'

class Admin::MeetingsControllerTest < ActionController::TestCase
  setup do
    @admin_meeting = admin_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_meeting" do
    assert_difference('Admin::Meeting.count') do
      post :create, :admin_meeting => @admin_meeting.attributes
    end

    assert_redirected_to admin_meeting_path(assigns(:admin_meeting))
  end

  test "should show admin_meeting" do
    get :show, :id => @admin_meeting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_meeting.to_param
    assert_response :success
  end

  test "should update admin_meeting" do
    put :update, :id => @admin_meeting.to_param, :admin_meeting => @admin_meeting.attributes
    assert_redirected_to admin_meeting_path(assigns(:admin_meeting))
  end

  test "should destroy admin_meeting" do
    assert_difference('Admin::Meeting.count', -1) do
      delete :destroy, :id => @admin_meeting.to_param
    end

    assert_redirected_to admin_meetings_path
  end
end
