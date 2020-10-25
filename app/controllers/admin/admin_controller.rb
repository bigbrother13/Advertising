class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  protected

  def check_admin
    binding.pry
    redirect_to root_path, alert: "You do not have permission to access this page" unless current_user.admin?
  end
end
