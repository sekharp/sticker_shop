class CreateOrderStickers < ActiveRecord::Migration
  def change
    create_table :order_stickers do |t|
      t.integer :quantity
      t.references :order, index: true, foreign_key: true
      t.references :sticker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
