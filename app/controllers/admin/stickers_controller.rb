class Admin::StickersController < Admin::BaseController
  def index
    @stickers = Sticker.all
  end

  def new
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
      flash[:success] = "Successfully added #{view_context.link_to "#{@sticker.title}", sticker_path(@sticker.id)} sticker to the store.".html_safe
      redirect_to stickers_path
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    @sticker = Sticker.find(params[:id])
  end

  private

  def sticker_params
    params.require(:sticker).permit(:title,
                                    :description,
                                    :price,
                                    :image,
                                    :retired)
  end
end
