class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :set_post, only: :show

  def search
    if params[:search].present?
      @pins = Pin.search(params[:search])
    else
      @pins = Pin.all
    end
  end

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was Successfully update!"
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

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :all_tags, :category_id)
  end

  def set_post
    @pin = Pin.find(params[:id])
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
