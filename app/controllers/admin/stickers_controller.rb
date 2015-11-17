class Admin::StickersController < Admin::BaseController
  def new
    @categories = Category.all.map { |cat| [cat.title, cat.id] }
    @sticker = Sticker.new
  end

  def create
    category = Category.where(slug: params[:sticker][:category].parameterize).first_or_create
    @sticker = category.stickers.new(sticker_params)
    if Sticker.exists?(title: sticker_params[:title])
      flash[:error] = "A sticker with the title of '#{@sticker.title}' already exists. Please enter a new title."
      render :new
    elsif @sticker.price < 0.01
      flash[:error] = "The price $#{@sticker.price} is too low. Please enter a new price."
      render :new
    elsif @sticker.save
      flash[:success] = "#{@sticker.title.upcase} sticker created"
      redirect_to stickers_path
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

  def sticker_params
    params.require(:sticker).permit(:title,
                                    :description,
                                    :price,
                                    :image_url)
  end
end
