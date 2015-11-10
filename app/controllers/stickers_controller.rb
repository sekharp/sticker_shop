class StickersController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @stickers = @category.stickers.all
  end
end
