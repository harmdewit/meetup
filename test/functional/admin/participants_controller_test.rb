require 'test_helper'

class Admin::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @admin_participant = admin_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_participant" do
    assert_difference('Admin::Participant.count') do
      post :create, :admin_participant => @admin_participant.attributes
    end

    assert_redirected_to admin_participant_path(assigns(:admin_participant))
  end

  test "should show admin_participant" do
    get :show, :id => @admin_participant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_participant.to_param
    assert_response :success
  end

  test "should update admin_participant" do
    put :update, :id => @admin_participant.to_param, :admin_participant => @admin_participant.attributes
    assert_redirected_to admin_participant_path(assigns(:admin_participant))
  end

  test "should destroy admin_participant" do
    assert_difference('Admin::Participant.count', -1) do
      delete :destroy, :id => @admin_participant.to_param
    end

    assert_redirected_to admin_participants_path
  end
end
