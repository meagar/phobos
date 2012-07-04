class PagesController < ApplicationController

  def home
    @events = GoogleCalendar::events.first(4)
  end

  def calendar
  end

  protected

  def active_nav
    @active_nav ||= action_name.titleize
  end

end
