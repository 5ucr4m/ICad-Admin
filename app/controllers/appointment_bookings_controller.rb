# frozen_string_literal: true
class AppointmentBookingsController < WebController
  before_action :set_appointment_booking, only: %i[show edit update destroy]

  breadcrumb AppointmentBooking.model_name.human(count: 2), :appointment_bookings_path

  # GET /appointment_bookings
  def index
    authorize(AppointmentBooking)
    @query = AppointmentBooking.ransack(params[:q])
    @result = @query.result
    if current_user.doctor?
      @result = @result.includes(:health_professional)
                    .where(health_professional: HealthProfessional.find_by(user: current_user))
    end
    @pagy, @appointment_bookings = pagy(@result.includes(:family_member,
                                                         :medical_procedure, :health_professional), page: params[:page], items: 10)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /appointment_bookings/1
  def show
    authorize(@appointment_booking)
    breadcrumb(@appointment_booking.slug, appointment_booking_path)
    @family_member_selected = @appointment_booking.family_member.presence
  end

  # GET /appointment_bookings/new
  def new
    authorize(AppointmentBooking)
    breadcrumb(t('helpers.submit.new'), new_appointment_booking_path)
    @appointment_booking = AppointmentBooking.new
  end

  # GET /appointment_bookings/1/edit
  def edit
    authorize(@appointment_booking)
    breadcrumb(@appointment_booking.slug, appointment_booking_path(@appointment_booking))
  end

  # POST /appointment_bookings
  def create
    authorize(AppointmentBooking)
    breadcrumb(t('helpers.submit.new'), new_appointment_booking_path)
    @appointment_booking = AppointmentBooking.new(appointment_booking_params)
    @family_member_selected = @appointment_booking.family_member.presence

    if @appointment_booking.save
      redirect_to(@appointment_booking, notice: 'Appointment booking was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /appointment_bookings/1
  def update
    authorize(AppointmentBooking)
    breadcrumb(@appointment_booking.slug, appointment_booking_path(@appointment_booking))
    if @appointment_booking.update(appointment_booking_params)
      redirect_to(@appointment_booking, notice: 'Appointment booking was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /appointment_bookings/1
  def destroy
    authorize(AppointmentBooking)
    @appointment_booking.destroy
    redirect_to(appointment_bookings_url, notice: 'Appointment booking was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment_booking
    @appointment_booking = AppointmentBooking.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_booking_params
    params.require(:appointment_booking).permit(:health_professional_id, :family_member_id,
                                                :appointment_date, :start_hour, :end_hour, :observation,
                                                :priority,
                                                :phone, :medical_procedure_id)
  end
end
