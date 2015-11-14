class OrderSticker < ActiveRecord::Base
  belongs_to :sticker
  belongs_to :order
end
