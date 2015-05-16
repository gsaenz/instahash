require 'test_helper'

class GetAlbumsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

end
