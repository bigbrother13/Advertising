class Admin::PinsController < Shared::PinsController
  before_action :authenticate_user!
  before_action :check_admin

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user = current_user
    
    if @pin.save
      redirect_to @pin, notice: "Successfully created new Pin"
    else
      render 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was successfully update!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  protected

  def check_admin
    redirect_to root_path, alert: "You do not have permission to access this page" unless current_user.admin?
  end
end
