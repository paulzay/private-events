require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Paul Zay', email: 'zay@gmail.com')
  end
  test 'should be valid' do
    assert @user.valid?
  end
  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end
  test 'email should be present' do
    @user.email = "
    "
    assert_not @user.valid?
  end
  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end
  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'user name should be unique' do
    @user.save
    @user2 = User.new(name: 'Paul Zay')
    assert_not @user2.valid?
  end
end
