class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:slug])
    @stickers = @category.stickers.all
  end
end
