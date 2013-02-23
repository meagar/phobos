
class Admin::BaseController < ApplicationController

  before_filter :require_admin_user

  protected

  def require_admin_user
    redirect_to login_path unless current_user
  end
end
