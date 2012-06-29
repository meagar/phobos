
class UsersController < ApplicationController

  def create
    @user = User.new
    @new_user = User.new(params[:user])

    if @new_user.save
      redirect_to root_url
    else
      render "sessions/new"
    end

  end

end

