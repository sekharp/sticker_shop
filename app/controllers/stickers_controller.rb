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

  def update
    @sticker = Sticker.find(params[:id])
    @sticker.update(sticker_params)
    if @sticker.save
      flash[:success] = "#{@sticker.title} saved"
      redirect_to admin_stickers_path
    else
      flash[:error] = "Something went wrong. Try again."
      render :edit
    end
  end

  private

  def sticker_params
    params.require(:sticker).permit(:title,
                                    :description,
                                    :price,
                                    :image_file_name,
                                    :retired)
  end
end
