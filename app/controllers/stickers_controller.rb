class StickersController < ApplicationController
  def index
    @stickers = Sticker.all
  end
end
