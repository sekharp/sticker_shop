require "test_helper"

class AdminStickerCreationTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create(username: "emily",
                          password: "password",
                          role: 1)

    visit login_path

    fill_in "Username", with: "emily"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test "admin can create item" do
    click_link "Add New Sticker"

    assert new_admin_sticker_path, current_path

    fill_in "Title", with: "New Sticker"
    fill_in "Category", with: "Ruby"
    fill_in "Description", with: "New sticker description"
    fill_in "Price", with: 5
    click_button "Create Sticker"

    assert stickers_path, current_path
    within("#nav-bar") do
      assert page.has_content?("NEW STICKER sticker created")
    end
    within(".container") do
      assert page.has_content?("New sticker description")
    end
  end

  test "admin cannot create sticker with price of 0" do
    click_link "Add New Sticker"

    assert new_admin_sticker_path, current_path

    fill_in "Title", with: "New Sticker"
    fill_in "Category", with: "Ruby"
    fill_in "Description", with: "New sticker description"
    fill_in "Price", with: 0
    click_button "Create Sticker"

    within("#nav-bar") do
      assert page.has_content?("The price $0.0 is too low. Please enter a new price.")
    end
  end

  test "admin can create sticker if price includes a decimal" do
    click_link "Add New Sticker"

    assert new_admin_sticker_path, current_path

    fill_in "Title", with: "New Sticker"
    fill_in "Category", with: "Ruby"
    fill_in "Description", with: "New sticker description"
    fill_in "Price", with: 5.5
    click_button "Create Sticker"

    within("#nav-bar") do
      assert page.has_content?("NEW STICKER sticker created")
    end
  end
end
