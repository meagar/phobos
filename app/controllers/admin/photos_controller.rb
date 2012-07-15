
class Admin::PhotosController < Admin::Controller

  before_filter :find_photo_set, :only => %w(index sort new create)
  before_filter :find_photo, :only => %w(edit update destroy)

  def index
    @photos = @photo_set.photos.order(:position).all
  end

  def sort
    params[:order].each_with_index do |e, i|
      @photo_set.photos.find(e.to_i).update_attribute(:position, i)
    end
  end

  def new
    @photo = @photo_set.photos.new
  end

  def create
    @photo = @photo_set.photos.new(params[:photo])
    @photo.is_thumbnail = false
    if @photo.save
      redirect_to [:admin, @photo_set], :notice => "Photo created"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def find_photo
    @photo = @photo_set.photos.find(params[:id])
  end

  def find_photo_set
    @photo_set = PhotoSet.find(params[:photo_set_id])
  end

end

