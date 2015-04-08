require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
