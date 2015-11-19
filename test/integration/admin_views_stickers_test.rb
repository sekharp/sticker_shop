# As an Admin
#       When I visit "/admin/dashboard"
#       Then I should see a link for viewing all items
#       And when I click that link
#       Then my current path should be "/admin/items"
#       Then I should see a table with all items (active and inactive)
#       And each item should have:
#         - A thumbnail of the image
#         - Title that links to the item
#         - Description
#         - Status
#         - Actions (Edit)

require "test_helper"

class AdminViewsStickersTest < ActionDispatch::IntegrationTest
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
    fill_in "Image", with: "http://ruby.pe/img/rubyperu_logo.png"
    fill_in "Price", with: 5
    click_button "Create Sticker"
  end

  test "admin can view stickers" do
    visit admin_stickers_path

    sticker = Sticker.last

    within("#{sticker.slug}-highlight") do
      assert page.has_content?("New Sticker")
      assert page.has_content?("Ruby")
      assert page.has_content?("New sticker description")
      assert page.has_content?("New Sticker")
      assert page.has_content?(5)
    end

  end

end
