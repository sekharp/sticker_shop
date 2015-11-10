class StickersController < ApplicationController
  def index
    if params.include?("category_id")
      @category = Category.find(params[:category_id])
      @stickers = @category.stickers.all
    else
      @stickers = Sticker.all
    end
  end

  def all
    @category = Category.find_by(title: params[:title])
    @stickers = @category.stickers.all
  end
end
