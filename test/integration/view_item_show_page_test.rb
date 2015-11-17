class ItemShowPageTest < ActionDispatch::IntegrationTest
  test "visitor can view sticker details" do
    category = Category.create(title: "geeky")
    category.stickers.create(title: "Nodejs",
                             image: "http://devstickers.com/assets/img/cat/nodejs.png",
                             description: "Awesome Node.js sticker",
                             price: 2)

    visit categories_path
    click_link "Geeky"
    click_link "Nodejs-link"

    within("#sticker-details") do
      assert page.has_content?("Nodejs")
      assert page.has_content?("Awesome Node.js sticker")
    end
  end
end
