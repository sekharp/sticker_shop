class AddRetiredColumnToSticker < ActiveRecord::Migration
  def change
    add_column :stickers, :retired?, :boolean, default: false
  end
end
