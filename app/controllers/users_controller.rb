class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin
      @user = current_user.admin
    else
      @user = current_user
    end
    @pins = Pin.where(user: @user)
  end

  def show
    @user = User.find_by(username: params[:username])
  end
end