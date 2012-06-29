
class ForumsController < ApplicationController

  before_filter :find_forum, :only => %w(show)

  def index
    @forums = Forum.order(:position).all
  end

  def show
  end

  protected

  def find_forum
    @forum = Forum.find(params[:id])
  end

  def active_nav
    "Forums"
  end

end

