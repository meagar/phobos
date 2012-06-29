class PagesController < ApplicationController

  def home
  end

  def calendar
  end

  def contact
  end

  protected

  def active_nav
    @active_nav ||= action_name.titleize
  end

end
