
class Admin::NewsPostsController < Admin::Controller

  before_filter :find_news_post, :only => %w(show edit update destroy)

  def index
    @news_posts = NewsPost.order("created_at desc")
  end

  def show
  end

  def new
    @news_post = current_user.news_posts.new
  end

  def create
    @news_post = current_user.news_posts.new(params[:news_post])

    if @news_post.save
      redirect_to admin_news_posts_path, :notice => "News Post Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news_post.update_attributes(params[:news_post])
      redirect_to [:admin, @news_post], :notice => "News Post Updated"
    else
      render :new
    end
  end

  def destroy
    @news_post.destroy
    redirect_to admin_news_posts_path, :notice => "News Post Deleted"
  end

  protected

  def find_news_post
    @news_post = NewsPost.find(params[:id])
  end

end

