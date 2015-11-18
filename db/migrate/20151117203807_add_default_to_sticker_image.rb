class AddDefaultToStickerImage < ActiveRecord::Migration
  def change
    change_column_default(:stickers, :image_file_name, 'http://cumbrianrun.co.uk/wp-content/uploads/2014/02/default-placeholder.png')
  end
end
