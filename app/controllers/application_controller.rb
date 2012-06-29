class ApplicationController < ActionController::Base
  protect_from_forgery

  attr_accessor :active_nav

  helper_method :active_nav, :current_user, :logged_in?, :nav_items

  protected

  def current_user
    @user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def current_user= user
    @user = user
    session[:current_user_id] = user.id
  end

  def logged_in?
    not current_user.nil?
  end

  def nav_items
    @nav_items ||= YAML::load(File.open(Rails.root.join("config/navbar.yml")))
  end

end
