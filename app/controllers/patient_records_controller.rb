# frozen_string_literal: true
class PatientRecordsController < WebController
  before_action :set_patient_record, only: %i[show edit update destroy]

  # GET /patient_records
  def index
    @query = PatientRecord.ransack(params[:q])
    @pagy, @patient_records = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /patient_records/1
  def show
  end

  # GET /patient_records/new
  def new
    @patient_record = PatientRecord.new
    @patient_record.build_patient_soap
  end

  # GET /patient_records/1/edit
  def edit
  end

  # POST /patient_records
  def create
    @patient_record = PatientRecord.new(patient_record_params)

    if @patient_record.save
      redirect_to(@patient_record, notice: 'Prontuário criado com sucesso!')
    else
      render(:new)
    end
  end

  # PATCH/PUT /patient_records/1
  def update
    if @patient_record.update(patient_record_params)
      redirect_to(@patient_record, notice: 'Prontuário atualizado com sucesso!')
    else
      render(:edit)
    end
  end

  # DELETE /patient_records/1
  def destroy
    @patient_record.destroy
    redirect_to(patient_records_url, notice: 'Patient Record was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient_record
    @patient_record = PatientRecord.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def patient_record_params
    params.require(:patient_record).permit(:family_member_id,
                                           :appointment_booking_id, :appointment_demand_id,
                                           :appointment_reason_id, :appointment_brief,
                                           :cephalic_perimeter, :weight, :height, :imc,
                                           :calf_perimeter, :blood_pressure, :blood_pressure_to,
                                           :respiratory_rate, :heart_rate, :temperature,
                                           :saturation, :capillary_blood, :collected_time_id,
                                           :risk_vulnerability, :release_citizen, :patient_record_id,
                                           :other_appointment_booking_id,
                                           patient_soap_attributes: [
                                             :id,
                                             :subjective, :objective,
                                             :cephalic_perimeter, :weight, :height, :imc,
                                             :calf_perimeter, :blood_pressure, :blood_pressure_to,
                                             :respiratory_rate, :heart_rate, :temperature,
                                             :saturation, :capillary_blood, :collected_time_id,
                                             :last_period_date, :vaccination_updated,
                                             :evaluation, :plan,
                                             patient_soap_reasons_attributes: [
                                               :id,
                                               :ciap_code_id,
                                               :_destroy,
                                             ],
                                             patient_soap_conditions_attributes: [
                                               :id,
                                               :ciap_code_id,
                                               :cid_code_id,
                                               :active,
                                               :_destroy,
                                             ],
                                             patient_soap_interventions_attributes: [
                                               :id,
                                               :ciap_code_id,
                                               :cid_code_id,
                                               :notes,
                                               :_destroy,
                                             ],
                                             patient_soap_certificates_attributes: [
                                               :id,
                                               :default_certificate,
                                               :blank_certificate,
                                               :maternity_license,
                                               :print_cid_code,
                                               :issue_date,
                                               :description,
                                               :_destroy,
                                             ],
                                             patient_soap_exams_attributes: [
                                               :id,
                                               :exam_id,
                                               :cid_code_id,
                                               :request_date,
                                               :accomplishment_date,
                                               :result_date,
                                               :description,
                                               :glycated_hemoglobin,
                                               :procedure_justification,
                                               :observation,
                                               :high_cost,
                                               :_destroy,
                                             ],
                                             patient_soap_reminders_attributes: [
                                               :id,
                                               :private_reminder,
                                               :active,
                                               :description,
                                               :_destroy,
                                             ],
                                             patient_soap_medicines_attributes: [
                                               :id,
                                               :concentration,
                                               :medicine_id,
                                               :administration_way_id,
                                               :pharmaceutical_form_id,
                                               :recipe_type_id,
                                               :dose,
                                               :unique_dose,
                                               :continuous_dose,
                                               :dose_frequency_type_id,
                                               :dose_frequency,
                                               :dose_quantity,
                                               :treatment_date,
                                               :duration_type_id,
                                               :duration,
                                               :recommendations,
                                               :_destroy,
                                             ]
                                           ])
  end
end
