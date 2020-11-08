class PinsController < Shared::PinsController
  def index
    @pins = Pin.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
end
