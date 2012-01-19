require 'test_helper'

class Admin::MeetingsControllerTest < ActionController::TestCase
  setup do
    @backend_meeting = backend_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_meeting" do
    assert_difference('Admin::Meeting.count') do
      post :create, :backend_meeting => @backend_meeting.attributes
    end

    assert_redirected_to backend_meeting_path(assigns(:backend_meeting))
  end

  test "should show backend_meeting" do
    get :show, :id => @backend_meeting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @backend_meeting.to_param
    assert_response :success
  end

  test "should update backend_meeting" do
    put :update, :id => @backend_meeting.to_param, :backend_meeting => @backend_meeting.attributes
    assert_redirected_to backend_meeting_path(assigns(:backend_meeting))
  end

  test "should destroy backend_meeting" do
    assert_difference('Admin::Meeting.count', -1) do
      delete :destroy, :id => @backend_meeting.to_param
    end

    assert_redirected_to backend_meetings_path
  end
end
