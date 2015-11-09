require 'test_helper'

class AdminAuthorizationTest < ActionDispatch::IntegrationTest
  test "admin add sticker" do
    admin = User.create(username: "Vladmin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_sticker_path

    click_link "Add new sticker"

    fill_in "Title", with: "Thoughtbot Sticker"
    fill_in "Image", with: "www.thoughtbot-sticker.com"
    fill_in "Price", with: 3
    click_button "Create Sticker"

    assert page.has_content?("Thoughtbot Sticker")
    assert page.has_content?(3)
  end

  test "admin can login" do
    User.create(username: "Vladmin",
                password: "password",
                role: 1)

    visit "/login"

    fill_in "Username", with: "Vladmin"
    fill_in "Password", with: "password"
    click_button "Log in"

    assert page.has_content?("Welcome Vladmin!")
    assert page.has_content?("Logout")
  end
end
