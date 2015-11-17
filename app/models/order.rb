class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_stickers

  def finished?
    if self.status.include?("Completed") || self.status.include?("Cancelled")
      true
    end
  end
end
