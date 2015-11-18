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

    assert new_admin_sticker_path, current_path

    sticker = Sticker.create(title: "New Sticker",
                             category: "Ruby",
                             description: "New sticker description",
                             price: 5)
  end

  test "admin can view edit path" do
    visit admin_stickers_path

    click_button "Edit"

    assert edit_admin_sticker_path(sticker.id), current_path

    within("edit-sticker") do
      assert page.has_content?("Title")
      assert page.has_content?("New Sticker")
      assert page.has_content?("Title")
    end


    #       And I click "Edit"
    #       Then my current path should be "/admin/items/:ITEM_ID/edit"
    #       And I should be able to upate title, description, image, and status

    within("#nav-bar") do
      assert page.has_content?("NEW STICKER sticker created")
    end
    within(".container") do
      assert page.has_content?("New sticker description")
    end
  end

end
