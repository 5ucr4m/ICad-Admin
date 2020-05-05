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
    @patient_record = FamilyMember.find(params[:family_member_id]).patient_records.build
    @family_member = @patient_record.family_member
  end

  # GET /patient_records/1/edit
  def edit
  end

  # POST /patient_records
  def create
    @patient_record = PatientRecord.new(patient_record_params)

    if @patient_record.save
      redirect_to(@patient_record, notice: 'Patient Record was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /patient_records/1
  def update
    if @patient_record.update(patient_record_params)
      redirect_to(@patient_record, notice: 'Patient Record was successfully updated.')
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
                                           patient_record_procedures_attributes: [
                                             :id,
                                             :procedure_performed_id,
                                             :_destroy,
                                           ],
                                           family_member_attributes: [
                                               patient_conditions_attributes: [
                                                   :id,

                                               ]
                                           ])
  end
end
