# frozen_string_literal: true

class DashboardsController < WebController
  def dashboard
    authorize(:dashboard, :dashboard?)
    if current_user.on_service?
      @query = AppointmentBooking.ransack(params[:q])
      @result = @query.result.where(appointment_date: params[:q] && params[:q][:appointment_date].presence || Time.zone.today)
      if current_user.doctor?
        @result = @result.includes(:health_professional)
          .where(health_professional: HealthProfessional.find_by(user: current_user))
      end
      @pagy, @appointment_bookings = pagy(@result.includes(:family_member,
                                                                   :medical_procedure, :health_professional)
                                              .order(appointment_date: :asc),
                                          page: params[:page], items: 10)
    else
      @vaccination_campaigns = VaccinationCampaign.last(5)
      @periods = Period.order(end_date: :desc).last(3)
      @families = user.agent? ? Family.where(user: user).count : Family.count
      @family_members = user.agent? ? FamilyMember.where(user: user).count : FamilyMember.count
      @home_registrations = user.agent? ? HomeRegistration.where(user: user).count : HomeRegistration.count
      @home_visit_registrations = user.agent? ? HomeVisitRegistration.where(user: user).count : HomeVisitRegistration.count
      @individual_registrations = user.agent? ? IndividualRegistration.where(user: user).count : IndividualRegistration.count
    end
  end
end
