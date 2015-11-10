class Sticker < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true
  validates :image_url, presence: true

  belongs_to :category
end
