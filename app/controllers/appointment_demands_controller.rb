class AppointmentDemandsController < WebController
  before_action :set_appointment_demand, only: %i[show edit update destroy]

  # GET /appointment_demands
  def index
    @query = AppointmentDemand.ransack(params[:q])
    @pagy, @appointment_demands = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /appointment_demands/1
  def show
  end

  # GET /appointment_demands/new
  def new
    @appointment_demand = AppointmentDemand.new
  end

  # GET /appointment_demands/1/edit
  def edit
  end

  # POST /appointment_demands
  def create
    @appointment_demand = AppointmentDemand.new(appointment_demand_params)

    if @appointment_demand.save
      redirect_to @appointment_demand, notice: 'Appointment demand was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appointment_demands/1
  def update
    if @appointment_demand.update(appointment_demand_params)
      redirect_to @appointment_demand, notice: 'Appointment demand was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointment_demands/1
  def destroy
    @appointment_demand.destroy
    redirect_to appointment_demands_url, notice: 'Appointment demand was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment_demand
    @appointment_demand = AppointmentDemand.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_demand_params
    params.require(:appointment_demand).permit(:family_member_id, :health_professional_id,
                                               :manage_medicine, :curative, :appointment_demand,
                                               :initial_listening, :examination, :nebulization,
                                               :dentistry, :procedures, :vaccine)
  end
end
