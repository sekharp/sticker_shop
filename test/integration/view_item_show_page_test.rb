class ItemShowPageTest < ActionDispatch::IntegrationTest
  test "visitor can view sticker details" do
    category = Category.create(title: "geeky")
    category.stickers.create(title: "Node",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                             description: "Awesome Node.js sticker",
                             price: 2)

    visit categories_path
    click_link "Geeky"
    click_link "Node"

    within("#sticker-details") do
      assert page.has_content?("Node")
      assert page.has_content?("Awesome Node.js sticker")
    end
  end
end
