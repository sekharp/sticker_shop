# As an authenticated Admin:
#       I can create an item.
#         - An item must have a title, description and price.
#         - An item must belong to at least one category.
#         - The title and description cannot be empty.
#         - The title must be unique for all items in the system.
#         - The price must be a valid decimal numeric value and greater than zero.
#         - The photo is optional. If not present, a stand-in photo is used.

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
  end
end
