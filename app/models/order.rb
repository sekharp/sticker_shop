class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_stickers

  scope :completed, -> { where(status: "completed") }
  scope :paid, -> { where(status: "paid") }
  scope :cancelled, -> { where(status: "cancelled") }
  scope :ordered, -> { where(status: "ordered") }

  ORDER_STATUS = {
    "paid" => ["cancel", "mark as completed"],
    "ordered" => ["cancel", "mark as paid"],
    "cancelled" => [],
    "completed" => []
  }

  def finished?
    if status.include?("Completed") || status.include?("Cancelled")
      true
    end
  end

  def change_status_options
    ORDER_STATUS[status]
  end
end
