class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_stickers
end
