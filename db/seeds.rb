class Seed
  def self.start
    new.generate
  end

  def generate
    create_categories
    create_stickers
    create_users
    create_orders
    create_order_stickers
  end

  def create_categories
    @javascript_category = Category.create(title: "javascript")
    @ruby_category = Category.create(title: "ruby")
    @browser_category = Category.create(title: "browser")
    @git_category = Category.create(title: "git")
    @editor_category = Category.create(title: "editor")
    puts "#{Category.all.map(&:title).join(", ")} categories created."
  end

  def create_stickers
    @nodejs_sticker = @javascript_category.stickers.create(title: "Nodejs",
                                         image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                         price: 6,
                                         description: "Node.js logo")
    @reactjs_sticker = @javascript_category.stickers.create(title: "Reactjs",
                                         image: "http://devstickers.com/assets/img/cat/react-js.png",
                                         price: 8,
                                         description: "React.js logo")
    @ruby_sticker = @ruby_category.stickers.create(title: "Ruby",
                                   image: "http://devstickers.com/assets/img/cat/ruby.png",
                                   price: 82,
                                   description: "Ruby logo")
    @browser_category.stickers.create(title: "Chrome",
                                      image: "http://devstickers.com/assets/img/cat/chrome.png",
                                      price: 2,
                                      description: "Chrome logo")
    @javascript_category.stickers.create(title: "Angularjs",
                                         image: "http://devstickers.com/assets/img/cat/angularjs.png",
                                         price: 3,
                                         description: "Angular.js logo")
    @javascript_category.stickers.create(title: "Javascript",
                                         image: "http://devstickers.com/assets/img/cat/javascript.png",
                                         price: 5,
                                         description: "Javascript logo")
    @git_category.stickers.create(title: "Git",
                                  image: "http://devstickers.com/assets/img/cat/git.png",
                                  price: 55,
                                  description: "Git logo")
    @editor_category.stickers.create(title: "Vim",
                                     image: "http://devstickers.com/assets/img/pro/tnue.png",
                                     price: 7,
                                     description: "Vim logo")
    @editor_category.stickers.create(title: "Atom",
                                     image: "http://devstickers.com/assets/img/pro/iwyr.png",
                                     price: 6,
                                     description: "Atom logo")

    puts "#{Sticker.all.map(&:title).join(", ")} stickers created."
  end

  def create_users
    @sekhar = User.create(first_name: "Sekhar",
                          last_name: "Paladugu",
                          username: "sekhar",
                          password: "sekhar",
                          role: 1,
                          street_address: Faker::Address.street_address,
                          city: Faker::Address.city,
                          state: Faker::Address.state_abbr,
                          zip: Faker::Address.zip )
    @emily = User.create(first_name: "Emily",
                         last_name: "Dowdle",
                         username: "emily",
                         password: "emily",
                         role: 1,
                         street_address: Faker::Address.street_address,
                         city: Faker::Address.city,
                         state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip )
    @jason = User.create(first_name: "Jason",
                         last_name: "Pilz",
                         username: "jason",
                         password: "jason",
                         role: 1,
                         street_address: Faker::Address.street_address,
                         city: Faker::Address.city,
                         state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip )
    User.create(first_name: "Britney",
                last_name: "Spears",
                username: "britneyspears",
                password: "oopsididitagain",
                street_address: Faker::Address.street_address,
                city: Faker::Address.city,
                state: Faker::Address.state_abbr,
                zip: Faker::Address.zip )
    User.create(first_name: "Snoop",
                last_name: "Dogg",
                username: "snoopdogg",
                password: "momma",
                street_address: Faker::Address.street_address,
                city: Faker::Address.city,
                state: Faker::Address.state_abbr,
                zip: Faker::Address.zip )
    puts "#{User.all.map(&:username).join(", ")} users created."
  end

  def create_orders
    @order_1 = Order.create(status: "ordered",
                            user_id: @sekhar.id)
    @order_2 = Order.create(status: "paid",
                            user_id: @sekhar.id)
    @order_3 = Order.create(status: "cancelled",
                            user_id: @emily.id)
    @order_4 = Order.create(status: "completed",
                            user_id: @jason.id)
    puts "Orders with id #{Order.all.map(&:id).join(", ")} created."
  end

  def create_order_stickers
    OrderSticker.create(quantity: 3,
                        order_id: @order_1.id,
                        sticker_id: @nodejs_sticker.id)
    OrderSticker.create(quantity: 2,
                        order_id: @order_1.id,
                        sticker_id: @reactjs_sticker.id)
    OrderSticker.create(quantity: 5,
                        order_id: @order_2.id,
                        sticker_id: @ruby_sticker.id)
    OrderSticker.create(quantity: 3,
                        order_id: @order_3.id,
                        sticker_id: @nodejs_sticker.id)
    OrderSticker.create(quantity: 6,
                        order_id: @order_3.id,
                        sticker_id: @reactjs_sticker.id)
    OrderSticker.create(quantity: 2,
                        order_id: @order_4.id,
                        sticker_id: @ruby_sticker.id)
  end
end

Seed.start
