require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user with the password less then 4" do
	  user = User.new(email: "test@test.com", password: 123, password_confirmation: 123)
	  assert_not user.save
  end
end
