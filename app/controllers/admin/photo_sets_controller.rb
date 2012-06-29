
class Admin::PhotoSetsController < Admin::Controller

  before_filter :find_set, :only => %w(show edit update destroy)

  def index
    @photo_sets = PhotoSet.order(:position)
  end

  def sort
    params[:order].each_with_index do |e, i|
      PhotoSet.find(e.to_i).update_attribute(:position, i)
    end
  end

  def show
  end

  def new
    @photo_set = current_user.photo_sets.new
  end

  def create
    @photo_set = current_user.photo_sets.new(params[:photo_set])

    if @photo_set.save
      redirect_to admin_photo_sets_path, :notice => "Photo set created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo_set.update_attributes(params[:photo_set])
      redirect_to [:admin, @photo_set], :notice => "Photo Set Updated"
    else
      render :edit
    end
  end

  def destroy
  end

  protected

  def find_set
    @photo_set = PhotoSet.includes(:photos).find(params[:id])
  end

end

