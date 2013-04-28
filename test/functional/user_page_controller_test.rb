require 'test_helper'

class UserPageControllerTest < ActionController::TestCase
  test "should get account" do
    get :account
    assert_response :success
  end

end
