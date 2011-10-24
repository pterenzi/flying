require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get manage_permission" do
    get :manage_permission
    assert_response :success
  end

end
