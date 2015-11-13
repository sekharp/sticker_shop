require "test_helper"

class VisitorView < ActionDispatch::IntegrationTest
  test "site visitor can view stickers index" do
    Sticker.create(title: "Nodejs",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path

    assert page.has_content?("Node.js logo")
    assert page.has_css?("img[src*='http://devstickers.com/assets/img/cat/nodejs.png']")
  end
end
