require "test_helper"

class VisitorView < ActionDispatch::IntegrationTest
  test "site visitor can view stickers index" do
    sticker = Sticker.create(title: "Nodejs",
                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path

    assert page.has_content?("Node.js logo")
    assert page.has_css?("img[src*='#{sticker.image.url}']")
  end
end
