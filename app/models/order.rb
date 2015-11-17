class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_stickers

  scope :completed, -> { where(status: "completed") }
  scope :paid, -> { where(status: "paid") }
  scope :cancelled, -> { where(status: "cancelled") }
  scope :ordered, -> { where(status: "ordered") }

  def finished?
    if status.include?("Completed") || status.include?("Cancelled")
      true
    end
  end

  def message
    if order_stickers.map { |os| os.sticker.retired? }.include?(true)
      "Order includes item(s) no longer available."
    else
      nil
    end
  end
end
