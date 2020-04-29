# frozen_string_literal: true
class AppointmentDemandsController < WebController
  before_action :set_appointment_demand, only: %i[show edit update destroy]

  breadcrumb AppointmentDemand.model_name.human(count: 2), :appointment_demands_path

  # GET /appointment_demands
  def index
    authorize(AppointmentDemand)
    @query = AppointmentDemand.ransack(params[:q])
    @result = @query.result
    @result = if current_user.doctor?
      @result.includes(:health_professional)
        .where(health_professional: HealthProfessional.find_by(user: current_user))
    else
      @result.includes(:family_member, :health_professional)
    end
    @pagy, @appointment_demands = pagy(@result, page: params[:page], items: 10)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /appointment_demands/1
  def show
    authorize(@appointment_demand)
  end

  # GET /appointment_demands/new
  def new
    authorize(AppointmentDemand)
    breadcrumb(t('helpers.submit.new'), new_appointment_demand_path)
    @appointment_demand = AppointmentDemand.new
  end

  # GET /appointment_demands/1/edit
  def edit
    authorize(@appointment_demand)
    breadcrumb(@appointment_demand.slug, appointment_demand_path)
  end

  # POST /appointment_demands
  def create
    authorize(AppointmentDemand)
    breadcrumb(t('helpers.submit.new'), new_appointment_demand_path)
    @appointment_demand = AppointmentDemand.new(appointment_demand_params)

    if @appointment_demand.save
      redirect_to(@appointment_demand, notice: 'Appointment demand was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /appointment_demands/1
  def update
    authorize(@appointment_demand)
    breadcrumb(t('helpers.submit.new'), appointment_demand_path)
    if @appointment_demand.update(appointment_demand_params)
      redirect_to(@appointment_demand, notice: 'Appointment demand was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /appointment_demands/1
  def destroy
    @appointment_demand.destroy
    redirect_to(appointment_demands_url, notice: 'Appointment demand was successfully destroyed.')
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
