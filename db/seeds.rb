class Seed
  def self.start
    new.generate
  end

  def generate
    create_categories
    create_stickers
  end

  def create_categories
    @javascript_category = Category.create(title: "javascript")
    @ruby_category = Category.create(title: "ruby")
    @browser_category = Category.create(title: "browser")
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
    puts "#{Sticker.all.map(&:title).join(", ")} created."
  end

end

Seed.start
