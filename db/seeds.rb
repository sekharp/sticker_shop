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
    @angularjs_sticker = @javascript_category.stickers.create(title: "Angularjs",
                                         image: "http://devstickers.com/assets/img/cat/angularjs.png",
                                         price: 15,
                                         description: "Angular.js logo")
    @ruby_sticker = @ruby_category.stickers.create(title: "Ruby",
                                   image: "http://devstickers.com/assets/img/cat/ruby.png",
                                   price: 82,
                                   description: "Ruby logo")
    @chrome_sticker = @browser_category.stickers.create(title: "Chrome",
                                      image: "http://devstickers.com/assets/img/cat/chrome.png",
                                      price: 2,
                                      description: "Chrome logo")
    @javascript_category.stickers.create(title: "Javascript",
                                         image: "http://devstickers.com/assets/img/cat/javascript.png",
                                         price: 5,
                                         description: "Javascript logo")
    @git_category.stickers.create(title: "Git",
                                  image: "http://devstickers.com/assets/img/cat/git.png",
                                  price: 55,
                                  description: "Git logo")
    @vim_sticker = @editor_category.stickers.create(title: "Vim",
                                     image: "http://devstickers.com/assets/img/pro/tnue.png",
                                     price: 7,
                                     description: "Vim logo",
                                     retired: true)
    @editor_category.stickers.create(title: "Atom",
                                     image: "http://devstickers.com/assets/img/pro/iwyr.png",
                                     price: 6,
                                     description: "Atom logo")
    Sticker.create(title: "HTML5 + CSS3",
                   image: "http://devstickers.com/assets/img/cat/html5-css3.png",
                   price: 1,
                   description: "HTML5 and CSS3 logo")
    Sticker.create(title: "Linux",
                   image: "http://devstickers.com/assets/img/cat/linux.png",
                   price: 10,
                   description: "Linux logo")
    Sticker.create(title: "PHP",
                   image: "http://devstickers.com/assets/img/cat/php.png",
                   price: 12,
                   description: "PHP logo")
    Sticker.create(title: "Bower",
                   image: "http://devstickers.com/assets/img/cat/bower.png",
                   price: 15,
                   description: "Bower logo")
    Sticker.create(title: "Jenkins",
                   image: "http://devstickers.com/assets/img/cat/jenkins.png",
                   price: 8,
                   description: "Jenkins logo")
    Sticker.create(title: "Java",
                   image: "http://devstickers.com/assets/img/cat/java.png",
                   price: 2,
                   description: "Java logo")
    Sticker.create(title: "Caffeine",
                   image: "http://devstickers.com/assets/img/cat/caffeine.png",
                   price: 18,
                   description: "Caffeine logo")
    Sticker.create(title: "Yeoman",
                   image: "http://devstickers.com/assets/img/cat/yeoman.png",
                   price: 9,
                   description: "Yeoman logo")
    Sticker.create(title: "Reddit",
                   image: "http://devstickers.com/assets/img/cat/reddit.png",
                   price: 110,
                   description: "Reddit logo")
    Sticker.create(title: "NASA",
                   image: "http://devstickers.com/assets/img/cat/nasa.png",
                   price: 69,
                   description: "NASA logo")
    Sticker.create(title: "Emoji",
                   image: "http://devstickers.com/assets/img/cat/emoji.png",
                   price: 44,
                   description: "Emojis of monkeys")
    Sticker.create(title: "Programming Languages",
                   image: "http://devstickers.com/assets/img/cat/programming-languages.png",
                   price: 28,
                   description: "Programming languages humor")

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
    @britney = User.create(first_name: "Britney",
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
    @order_5 = Order.create(status: "completed",
                            user_id: @britney.id)
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
                        order_id: @order_1.id,
                        sticker_id: @ruby_sticker.id)
    OrderSticker.create(quantity: 4,
                        order_id: @order_2.id,
                        sticker_id: @vim_sticker.id)
    OrderSticker.create(quantity: 2,
                        order_id: @order_2.id,
                        sticker_id: @chrome_sticker.id)
    OrderSticker.create(quantity: 3,
                        order_id: @order_3.id,
                        sticker_id: @nodejs_sticker.id)
    OrderSticker.create(quantity: 6,
                        order_id: @order_4.id,
                        sticker_id: @reactjs_sticker.id)
    OrderSticker.create(quantity: 2,
                        order_id: @order_5.id,
                        sticker_id: @angularjs_sticker.id)
  end
end

Seed.start
