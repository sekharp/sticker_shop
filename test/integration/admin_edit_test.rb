require "test_helper"

class AdminEditStickerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create(username: "emily",
                          password: "password",
                          role: 1)

    visit login_path

    fill_in "Username", with: "emily"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Add New Sticker"

    fill_in "Title", with: "New Sticker"
    fill_in "Category", with: "Ruby"
    fill_in "Description", with: "New sticker description"
    fill_in "Price", with: 5
    fill_in "Image", with: "http://devstickers.com/assets/img/pro/uwgt.png"
    click_button "Create Sticker"
  end

  test "admin can view edit path" do
    visit admin_stickers_path
    sticker = Sticker.last
    click_link "Edit"

    assert edit_admin_sticker_path(sticker.id), current_path

    within("#edit-sticker") do
      assert page.has_content?("Title")
      assert "New Sticker", find_field("Title").value
      assert page.has_content?("Category")
      assert "Ruby", find_field("Category").value
      assert page.has_content?("Price")
      assert "5", find_field("Price").value
    end

    fill_in "Description", with: "Edited Sticker"
    click_button "Update Sticker"

    assert admin_stickers_path, current_path

    assert page.has_content?("Edited Sticker")
  end

  test "admin can edit sticker status" do
    visit admin_stickers_path
    click_link "Edit"

    choose("sticker_retired_true")
    click_button "Update Sticker"

    assert admin_stickers_path, current_path

    click_link "Edit"

    within("#edit-sticker") do
      assert page.has_content?("currently not available")
    end
  end
end
