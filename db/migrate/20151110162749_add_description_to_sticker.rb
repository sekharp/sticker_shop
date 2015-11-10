class AddDescriptionToSticker < ActiveRecord::Migration
  def change
    add_column :stickers, :description, :text
  end
end
