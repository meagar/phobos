class PagesController < ApplicationController

  def home
    @events = GoogleCalendar::events.first(4)

    @links = [
      [ "New Union Project", "http://www.newunionproject.ca/", "new-union-logo.png" ],
      [ "CAW Local 27", "http://www.cawlocal27.com/", "caw-logo.jpg" ],
    ].map { |link|
      OpenStruct.new :name => link[0], :url => link[1], :image => link[2]
    }
  end

  def links
    # Render the links page
  end

  def calendar
  end

  protected

  def active_nav
    @active_nav ||= action_name.titleize
  end

end
