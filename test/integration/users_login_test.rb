require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should user login" do
    get login_path
    post login_path params: { email: @user.email, password: 'password' }
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".welcome", "Hi #{@user.name}"
  end

  test "should require authenticate user" do
    get root_path
    assert_redirected_to login_path
    follow_redirect!
  end
end
