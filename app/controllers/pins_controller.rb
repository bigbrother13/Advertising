class PinsController < Shared::PinsController
  def index
    @pins = Pin.all.order("created_at DESC")
  end
end
