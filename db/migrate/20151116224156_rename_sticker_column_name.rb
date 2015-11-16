class RenameStickerColumnName < ActiveRecord::Migration
  def change
    rename_column :stickers, :retired?, :retired
  end
end
