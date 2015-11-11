class Sticker < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true
  validates :image_url, presence: true

  belongs_to :category

  def self.cart_items(raw_ids)
    raw_ids.keys.map do |k|
      Sticker.where(id: k.to_i)
    end[0]
  end
end
