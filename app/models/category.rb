class Category < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true

  has_many :stickers
end
