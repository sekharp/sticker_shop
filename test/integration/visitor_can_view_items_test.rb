require 'test_helper'

class VisitorView < ActionDispatch::IntegrationTest
  test "site visitor can view stickers" do
    Sticker.create(title: "Awesome sticker",
                   image: "some-url",
                   price: 2)

    visit stickers_path

    assert page.has_content?("Awesome sticker")
    assert page.has_content?(2)
  end
end
