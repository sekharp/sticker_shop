class Category < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true

  has_many :stickers

  before_save :to_slug

  def to_param
    slug
  end

  def to_slug
    self.slug = title.parameterize
  end
end
