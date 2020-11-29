class PinsController < Shared::PinsController
  def index
    pins = current_user && current_user.admin? ? Pin.all : Pin.published
    @pins = pins.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end


  def new_status
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
    redirect_to pin_path(@pin)
  end

  def approved
    @pin = Pin.find(params[:id])
    @pin.status = 4
    @pin.save
    redirect_to pin_path(@pin)
  end

  def rejected
    @pin = Pin.find(params[:id])
    @pin.status = 3
    @pin.save
    redirect_to pin_path(@pin), notice: "Pin rejected!"
  end
end
