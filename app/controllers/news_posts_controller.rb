
class NewsPostsController < ApplicationController

  def show
    @news_post = NewsPost.find(params[:id])
    @events = GoogleCalendar::events.first(10)
  end

end

