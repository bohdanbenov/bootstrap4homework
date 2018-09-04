class ImagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @all_urls = Favourite.where(user_id: params[:user_id]).order(:id)
  end

  def update
    u_id = User.find(params[:user_id])
    img_url = params[:url]
    u_id.favourites.create(url: img_url)
  end
end
