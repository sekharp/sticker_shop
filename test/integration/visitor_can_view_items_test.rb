require 'test_helper'

class VisitorView < ActionDispatch::IntegrationTest
  test "site visitor can view stickers" do
    cat = Category.create(title: "Category")

    cat.stickers.create(title: "Awesome sticker",
                        image_url: "some-url",
                        price: 2)

    visit root_path

    assert page.has_content?("Awesome sticker")
    assert page.has_content?(2)
    assert page.has_css?("img[src*='some-url']")
  end
end
