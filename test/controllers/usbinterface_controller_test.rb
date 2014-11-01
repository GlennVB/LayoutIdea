require 'test_helper'

class UsbinterfaceControllerTest < ActionController::TestCase
  test "should get light" do
    get :light
    assert_response :success
  end

  test "should get dev" do
    get :dev
    assert_response :success
  end

end
