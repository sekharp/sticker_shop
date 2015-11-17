class Sticker < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true
  validates :price, presence: true
  validates :image_url, presence: true

  belongs_to :category
  has_many :order_stickers
end
