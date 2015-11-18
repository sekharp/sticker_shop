# Background: an existing item
#       As an admin
#       When I visit "admin/items"
#       And I click "Edit"
#       Then my current path should be "/admin/items/:ITEM_ID/edit"
#       And I should be able to upate title, description, image, and status

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
  end

  test "admin can view edit path" do
    

  end

end
