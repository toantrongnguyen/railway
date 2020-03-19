require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should valid user" do
    assert @user.valid?
  end

  test "should be a valid email" do
    @user.email = 'bar'
    assert_not @user.valid?
  end

  test "should name is not missing" do
    @user.name = '    '
    assert @user.invalid?
  end

  test "should email is unique" do
    @user.save
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?
  end
end
