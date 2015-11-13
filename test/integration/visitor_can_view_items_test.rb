require "test_helper"

class VisitorView < ActionDispatch::IntegrationTest
  test "site visitor can view stickers index" do
    cat = Category.create(title: "Category")

    cat.stickers.create(title: "Awesome sticker",
                        description: "Awesome sticker description",
                        image_url: "some-url")

    visit root_path

    assert page.has_content?("Awesome sticker description")
    assert page.has_css?("img[src*='some-url']")
  end
end
