class AddCategoryRefToStickers < ActiveRecord::Migration
  def change
    add_reference :stickers, :category, index: true, foreign_key: true
  end
end
