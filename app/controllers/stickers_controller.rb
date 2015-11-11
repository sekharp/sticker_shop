class StickersController < ApplicationController
  def index
    if params.include?("category_id")
      @category = Category.find(params[:category_id])
      @stickers = @category.stickers.all
    else
      @stickers = Sticker.all
    end
  end

end
