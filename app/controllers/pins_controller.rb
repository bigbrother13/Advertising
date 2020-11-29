class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    pins = current_user && current_user.admin? ? Pin.all : Pin.published
    @pins = pins.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end


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

  def new_status
    @pin = Pin.find(params[:id])
    @pin.status = 1
    @pin.save
    redirect_to pin_path(@pin), notice: "Successfully assigned status New"
  end

  def approved
    @pin = Pin.find(params[:id])
    @pin.status = 4
    @pin.save
    redirect_to pin_path(@pin), notice: "Successfully assigned status Approved"
  end

  def rejected
    @pin = Pin.find(params[:id])
    @pin.status = 3
    @pin.save
    redirect_to pin_path(@pin), notice: "Successfully assigned status Rejected"
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :all_tags, :category_id)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
