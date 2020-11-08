class Shared::PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]

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
