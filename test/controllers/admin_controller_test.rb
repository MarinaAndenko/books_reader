require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get add_genre" do
    get :add_genre
    assert_response :success
  end

  test "should get edit_user_role" do
    get :edit_user_role
    assert_response :success
  end

end
