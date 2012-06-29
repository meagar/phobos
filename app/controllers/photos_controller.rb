
class PhotosController < ApplicationController

  def index
    @photos = Photo.order(:position).all
  end

  def show
  end

end
