class Seed
  def self.start
    new.generate
  end

  def generate
    create_stickers
  end

  def create_stickers
    Sticker.create(title: "Node.js", image_url: "http://devstickers.com/assets/img/cat/nodejs.png", price: 6)
    Sticker.create(title: "React.js", image_url: "http://devstickers.com/assets/img/cat/react-js.png", price: 8)
    Sticker.create(title: "Ruby", image_url: "http://devstickers.com/assets/img/cat/ruby.png", price: 82)
    Sticker.create(title: "Chrome", image_url: "http://devstickers.com/assets/img/cat/chrome.png", price: 2)
    puts "#{Sticker.all.map(&:title).join(", ")} created."
  end
end

Seed.start
