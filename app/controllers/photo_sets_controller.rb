
class PhotoSetsController < ApplicationController

  def index
    @photo_sets = PhotoSet.order(:position).all
  end

  def show
    @photo_set = PhotoSet.find(params[:id])
  end

  protected

  def active_nav
    "photos"
  end
end

