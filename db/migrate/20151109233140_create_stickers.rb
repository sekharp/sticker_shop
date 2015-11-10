class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.string :title
      t.string :image_url
      t.integer :price

      t.timestamps null: false
    end
  end
end
