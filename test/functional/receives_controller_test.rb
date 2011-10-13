require 'test_helper'

class ReceivesControllerTest < ActionController::TestCase
  setup do
    @receive = receives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive" do
    assert_difference('Receive.count') do
      post :create, :receive => @receive.attributes
    end

    assert_redirected_to receive_path(assigns(:receive))
  end

  test "should show receive" do
    get :show, :id => @receive.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @receive.to_param
    assert_response :success
  end

  test "should update receive" do
    put :update, :id => @receive.to_param, :receive => @receive.attributes
    assert_redirected_to receive_path(assigns(:receive))
  end

  test "should destroy receive" do
    assert_difference('Receive.count', -1) do
      delete :destroy, :id => @receive.to_param
    end

    assert_redirected_to receives_path
  end
end
