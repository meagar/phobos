
class Admin::ArticlesController < Admin::BaseController

  before_filter :find_article, :only => %w(show edit update destroy)

  def index
    @articles = Article.order(:position)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.authored_articles.new(create_params)

    if @article.save
      redirect_to [:admin, @article], :notice => "Article Created"
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @article.update_attributes(update_params)
      redirect_to [:admin, @article], :notice => "Article Updated"
    else
      render :edit
    end
  end

  def destroy
  end

  protected

  def find_article
    @article = Article.find(params[:id])
  end

  def create_params
    (params[:article] || {}).slice(:title, :body, :format, :posted_on)
  end

  def update_params
    create_params
  end

end

