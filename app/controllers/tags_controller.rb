class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(name: params[:id])
    @pins = @tag.pins
  end
end

