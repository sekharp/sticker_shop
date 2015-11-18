require 'test_helper'

class UserTest < ActiveSupport::TestCase
  valid_params = { username: "beyonce",
                   password: "putaringonit",
                   role: 1 }

  should have_many(:orders)

  test "it is valid with correct params" do
    user = User.new(valid_params)
    assert user.valid?
  end

  test "it is invalid without username" do
    user = User.new( username: "",
                     password: "password",
                     role: 1 )
    assert user.invalid?
  end

  test "it is invalid without password" do
    user = User.new( username: "Dr. Dre",
                     role: 1 )
    assert user.invalid?
  end

  test "username must be unique" do
    user = User.create(valid_params)
    same_user = User.new(valid_params)

    assert same_user.invalid?
  end

  test "has a default role as user" do
    user = User.new( username: "will",
                     password: "farrell")
    assert_equal "default", user.role
  end
end
