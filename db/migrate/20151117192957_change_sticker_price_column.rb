class ChangeStickerPriceColumn < ActiveRecord::Migration
  def change
    change_column(:stickers, :price, :decimal)
  end
end
