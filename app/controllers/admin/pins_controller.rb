class Admin::PinsController < ApplicationController
  before_action :find_pin, only: [:edit, :update, :destroy, :upvote]
  before_action :authenticate_user!
  before_action :check_admin

  def search
    if params[:search].present?
      @pins = Pin.search(params[:search])
    else
      @pins = Pin.all
    end
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Seccessfully created new Pin"
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

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  protected

  def check_admin
    redirect_to root_path, alert: "You do not have permission to access this page" unless current_user.admin?
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :all_tags, :category_id)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
