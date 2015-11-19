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

  test "visit index page from dashboard" do
    visit admin_dashboard_index_path

    assert page.has_content?("View All Stickers")
  end

  test "admin can view stickers" do
    visit admin_stickers_path

    sticker = Sticker.last

    within("#all-stickers") do
      assert page.has_css?("img[src*='#{sticker.image}']")
      assert page.has_content?("New Sticker")
      assert page.has_content?("New sticker description")
      assert page.has_content?("New Sticker")
      assert page.has_content?("false")
      assert page.has_content?("Edit")
    end

  end

end
