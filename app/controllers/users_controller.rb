
class UsersController < ApplicationController

  before_filter :find_user, :only => %w(show)

  def create
    @user = User.new
    @new_user = User.new(params[:user])

    if @new_user.save
      redirect_to root_url
    else
      render "sessions/new"
    end
  end

  def show
    if @user == current_user
      render :profile
    else
      render :show
    end
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def create_params
  end

  def update_params
    params[:user].slice(:display_name, :password, :password_confirmation)
  end

end

