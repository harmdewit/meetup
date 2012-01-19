require 'test_helper'

class Admin::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @backend_participant = backend_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_participant" do
    assert_difference('Admin::Participant.count') do
      post :create, :backend_participant => @backend_participant.attributes
    end

    assert_redirected_to backend_participant_path(assigns(:backend_participant))
  end

  test "should show backend_participant" do
    get :show, :id => @backend_participant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @backend_participant.to_param
    assert_response :success
  end

  test "should update backend_participant" do
    put :update, :id => @backend_participant.to_param, :backend_participant => @backend_participant.attributes
    assert_redirected_to backend_participant_path(assigns(:backend_participant))
  end

  test "should destroy backend_participant" do
    assert_difference('Admin::Participant.count', -1) do
      delete :destroy, :id => @backend_participant.to_param
    end

    assert_redirected_to backend_participants_path
  end
end
