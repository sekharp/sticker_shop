class VisitorCartQuantityChangesTest < ActionDispatch::IntegrationTest

  test "visitor can increase item quantity in cart" do
    sticker = Sticker.create(title: "Nodejs",
                             image: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6)

    visit root_path
    click_button "Add to Cart"

    click_link "Cart"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 1")

    click_button "+"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 2")
    assert page.has_content?("Successfully added Nodejs sticker to your cart.")
  end

  test "visitor can decrease item quantity in cart" do
    sticker = Sticker.create(title: "Nodejs",
                             image: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6)

    visit root_path
    click_button "Add to Cart"
    click_button "Add to Cart"

    click_link "Cart"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 2")

    click_button "-"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 1")
    assert page.has_content?("Successfully removed one Nodejs sticker from your cart.")
  end

end
