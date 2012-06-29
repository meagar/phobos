
class SessionsController < ApplicationController

  # get /login
  def new
    @user = User.new
    @new_user = User.new
  end

  # post /login
  def create
    new
    if @user = User.authenticate(user_params[:email], user_params[:password])
      self.current_user = @user
      redirect_to root_url
    else
      @user = User.new(:email => user_params[:email])
      @user.errors.add(:base, "Invalid username or password")
      render :new
    end
  end

  # match /logout
  def destroy
    reset_session
  end

  protected

  def user_params
    params[:user].slice(:email, :password)
  end

end
