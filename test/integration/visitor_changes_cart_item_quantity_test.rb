# Background: My cart has an item in it
#       As a visitor
#       When I visit "/cart"
#       Then I should see my item with a quantity of 1
#       And when I increase the quantity
#       Then my current page should be '/cart'
#       And that item's quantity should reflect the increase
#       And the subtotal for that item should increase
#       And the total for the cart should match that increase
#       And when I decrease the quantity
#       Then my current page should be '/cart'
#       And that item's quantity should reflect the decrease
#       And the subtotal for that item should decrease
#       And the total for the cart should match that decrease

class VisitorCartQuantityChangesTest < ActionDispatch::IntegrationTest

  test "visitor can increase item quantity in cart" do
    sticker = Sticker.create(title: "Nodejs",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6)

    visit root_path
    click_button "Add to Cart"

    click_link "Cart"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 1")

    click_button "+"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 2")
    assert page.has_content?("Sticker added to cart")
  end

  test "visitor can decrease item quantity in cart" do
    sticker = Sticker.create(title: "Nodejs",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
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
    assert page.has_content?("Sticker removed from cart")
  end

end
