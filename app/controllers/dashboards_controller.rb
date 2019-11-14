# frozen_string_literal: true

class DashboardsController < WebController
  def dashboard
    @vaccination_campaigns = VaccinationCampaign.last(5)
    @periods = Period.order(end_date: :desc).last(3)
    @families = user.agent? ? Family.where(user: user).count : Family.count
    @family_members = user.agent? ? FamilyMember.where(user: user).count : FamilyMember.count
    @home_registrations = user.agent? ? HomeRegistration.where(user: user).count : HomeRegistration.count
    @home_visit_registrations = user.agent? ? HomeVisitRegistration.where(user: user).count : HomeVisitRegistration.count
    @individual_registrations = user.agent? ? IndividualRegistration.where(user: user).count : IndividualRegistration.count
  end
end
