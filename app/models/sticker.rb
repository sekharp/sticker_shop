class Sticker < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true
  validates :image_url, presence: true

  belongs_to :category

  def self.cart_items(raw_ids)
    if raw_ids.nil?
      []
    else
      input_ids = raw_ids.keys.map(&:to_i)
      Sticker.find(input_ids)
    end
  end
end
