class ReservesController < ApplicationController
  before_action :set_reserf, only: [:show, :edit, :update, :destroy, :exit, :reservePdf]

  # GET /reserves
  # GET /reserves.json
  def index
    @reserves = Reserve.all
  end

  # GET /reserves/1
  # GET /reserves/1.json
  def show
  end

  # GET /reserves/new
  def new
    @reserf = Reserve.new
    @slot = Slot.find(params[:format])
    @reserf.slot = @slot
    @reserf.build_vehicle
    @vehicles = Vehicle.all
  end

  # GET /reserves/1/edit
  def edit
  end

  # POST /reserves
  # POST /reserves.json
  def create
    @reserf = Reserve.new(reserf_params)
    @reserf.busy = true

    respond_to do |format|
      if @reserf.save
        format.html { redirect_to root_path, notice: 'Reserve was successfully created.' }
        format.json { render :show, status: :created, location: @reserf }
      else
        format.html { render :new }
        format.json { render json: @reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /reserves/exit/1
  # En esta función se asimila el momento de la salida del vehículo del estacionamiento
  def exit
    @reserf.exitTime = DateTime.now
    @reserf.totalTime = (@reserf.initTime.to_time - @reserf.exitTime.to_time)/60
    @reserf.totalTime = @reserf.totalTime.abs.round
    @reserf.price = (@reserf.totalTime*30)
    @reserf.busy = false

    respond_to do |format|
      if @reserf.save
        format.html 
      else
        format.html { redirect_to root_path}
      end
    end
  end

  # GET /reservas/reservePdf/1
  # En esta función se crea un pdf con el detalle de la reserva al momento de la salida
  def reservePdf
    respond_to do |format|
      format.pdf do
        pdf = TicketPdf.new(@reserf)
        send_data pdf.render, filename: 'ticket.pdf', type: 'application/pdf', :disposition => "inline"
      end
    end
  end

  # PATCH/PUT /reserves/1
  # PATCH/PUT /reserves/1.json
  def update
    respond_to do |format|
      if @reserf.update(reserve_params)
        format.html { redirect_to @reserf, notice: 'Reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserf }
      else
        format.html { render :edit }
        format.json { render json: @reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1
  # DELETE /reserves/1.json
  def destroy
    @reserf.destroy
    respond_to do |format|
      format.html { redirect_to reserves_url, notice: 'Reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserf
      @reserf = Reserve.find(params[:id])
      @vehicle = @reserf.vehicle
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserf_params
      params.require(:reserve).permit(:slot_id, :initTime, vehicle_attributes: [:patente, :vehicle_type_id, :description, :phone])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:patente, :vehicle_type_id, :description, :phone)
    end
end
