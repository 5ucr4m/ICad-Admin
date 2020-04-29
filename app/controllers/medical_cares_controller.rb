# frozen_string_literal: true
class MedicalCaresController < WebController
  before_action :set_medical_care, only: %i[show edit update destroy]

  # GET /medical_cares
  def index
    @query = MedicalCare.ransack(params[:q])
    @pagy, @medical_cares = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /medical_cares/1
  def show
  end

  # GET /medical_cares/new
  def new
    @medical_care = MedicalCare.new
  end

  # GET /medical_cares/1/edit
  def edit
  end

  # POST /medical_cares
  def create
    @medical_care = MedicalCare.new(medical_care_params)

    if @medical_care.save
      redirect_to(@medical_care, notice: 'Medical care was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /medical_cares/1
  def update
    if @medical_care.update(medical_care_params)
      redirect_to(@medical_care, notice: 'Medical care was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /medical_cares/1
  def destroy
    @medical_care.destroy
    redirect_to(medical_cares_url, notice: 'Medical care was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medical_care
    @medical_care = MedicalCare.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def medical_care_params
    params.require(:medical_care).permit(:appointment_booking_id, :appointment_demand_id,
                                         :appointment_reason_id, :appointment_brief,
                                         :cephalic_perimeter, :weight, :height, :imc,
                                         :calf_perimeter, :blood_pressure, :blood_pressure_to,
                                         :respiratory_rate, :heart_rate, :temperature,
                                         :saturation, :capillary_blood, :collected_time_id,
                                         :risk_vulnerability, :release_citizen, :medical_care_id,
                                         :other_appointment_booking_id,
                                         medical_care_procedures_attributes: [
                                           :id,
                                           :procedure_performed_id,
                                           :_destroy,
                                         ])
  end
end
