class ChangeDefaultImageFileName < ActiveRecord::Migration
  def change
    change_column_default :stickers, :image_file_name, nil
    change_column_default :stickers, :image_url, nil
  end
end
