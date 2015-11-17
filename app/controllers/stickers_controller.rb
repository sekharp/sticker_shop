class StickersController < ApplicationController
  def index
    if params.include?("category_id")
      @category = Category.find(params[:category_id])
      @stickers = @category.stickers.all
    else
      @stickers = Sticker.all
    end
  end

  def show
    @sticker = Sticker.find(params[:id].to_i)
  end
end
