class Seed
  def self.start
    new.generate
  end

  def generate
    create_categories
    create_stickers
    create_users
    create_orders
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
    @javascript_category.stickers.create(title: "Nodejs",
                                         image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                                         price: 6,
                                         description: "Node.js logo")
    @javascript_category.stickers.create(title: "Reactjs",
                                         image_url: "http://devstickers.com/assets/img/cat/react-js.png",
                                         price: 8,
                                         description: "React.js logo")
    @ruby_category.stickers.create(title: "Ruby",
                                   image_url: "http://devstickers.com/assets/img/cat/ruby.png",
                                   price: 82,
                                   description: "Ruby logo")
    @browser_category.stickers.create(title: "Chrome",
                                      image_url: "http://devstickers.com/assets/img/cat/chrome.png",
                                      price: 2,
                                      description: "Chrome logo")
    @javascript_category.stickers.create(title: "Angularjs",
                                         image_url: "http://devstickers.com/assets/img/cat/angularjs.png",
                                         price: 3,
                                         description: "Angular.js logo")
    @javascript_category.stickers.create(title: "Javascript",
                                         image_url: "http://devstickers.com/assets/img/cat/javascript.png",
                                         price: 5,
                                         description: "Javascript logo")
    @git_category.stickers.create(title: "Git",
                                   image_url: "http://devstickers.com/assets/img/cat/git.png",
                                   price: 55,
                                   description: "Git logo")
    @editor_category.stickers.create(title: "Vim",
                                      image_url: "http://devstickers.com/assets/img/pro/tnue.png",
                                      price: 7,
                                      description: "Vim logo")
    @editor_category.stickers.create(title: "Atom",
                                      image_url: "http://devstickers.com/assets/img/pro/iwyr.png",
                                      price: 6,
                                      description: "Atom logo")

    puts "#{Sticker.all.map(&:title).join(", ")} stickers created."
  end

  def create_users
    @sekhar = User.create(first_name: "Sekhar", last_name: "Paladugu", username: "sekhar", password: "sekhar")
    @emily = User.create(first_name: "Emily", last_name: "Dowdle", username: "emily", password: "emily")
    @jason = User.create(first_name: "Jason", last_name: "Pilz", username: "jason", password: "jason")
    puts "#{User.all.map(&:username).join(", ")} users created."
  end

  def create_orders
    Order.create(status: "Ordered", user_id: @sekhar.id)
    Order.create(status: "Paid", user_id: @sekhar.id)
    Order.create(status: "Cancelled", user_id: @emily.id)
    Order.create(status: "Completed", user_id: @jason.id)
    puts "Orders with id #{Order.all.map(&:id).join(", ")} created."
  end

end

Seed.start
