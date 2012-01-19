require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @backend_user = backend_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_user" do
    assert_difference('Admin::User.count') do
      post :create, :backend_user => @backend_user.attributes
    end

    assert_redirected_to backend_user_path(assigns(:backend_user))
  end

  test "should show backend_user" do
    get :show, :id => @backend_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @backend_user.to_param
    assert_response :success
  end

  test "should update backend_user" do
    put :update, :id => @backend_user.to_param, :backend_user => @backend_user.attributes
    assert_redirected_to backend_user_path(assigns(:backend_user))
  end

  test "should destroy backend_user" do
    assert_difference('Admin::User.count', -1) do
      delete :destroy, :id => @backend_user.to_param
    end

    assert_redirected_to backend_users_path
  end
end
