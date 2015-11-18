class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_stickers

  scope :completed, -> { where(status: "completed") }
  scope :paid, -> { where(status: "paid") }
  scope :cancelled, -> { where(status: "cancelled") }
  scope :ordered, -> { where(status: "ordered") }

  def finished?
    if status.include?("completed") || status.include?("cancelled")
      true
    end
  end
end
