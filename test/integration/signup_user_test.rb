require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  #def setup
  #  @user = User.create(username: "john", email: "john@example.com", password: "password")
  #end
  
  test "get new user form and create(sign up) user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "john", email: "john@example.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "john", response.body
  end
end