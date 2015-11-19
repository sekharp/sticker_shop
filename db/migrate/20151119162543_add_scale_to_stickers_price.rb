class AddScaleToStickersPrice < ActiveRecord::Migration
  def change
    change_column :stickers, :price, :decimal, :precision => 8, :scale => 2
  end
end
