class Sticker < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true
  validates :price, presence: true

  belongs_to :category
  has_many :order_stickers

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
