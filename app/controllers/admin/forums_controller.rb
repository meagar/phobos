
class Admin::ForumsController < Admin::Controller

  def index
    @forums = Forum.order(:position)
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])

    if @forum.save
      redirect_to admin_forums_path
    else
      render :new
    end
  end

end

