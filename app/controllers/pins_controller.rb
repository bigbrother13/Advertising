class PinsController < Shared::PinsController
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
end
