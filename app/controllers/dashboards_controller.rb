# frozen_string_literal: true

class DashboardsController < WebController
  before_action :tabs

  def dashboard
    @vaccination_campaigns = VaccinationCampaign.by_company(current_user.company).last(5)
  end

  private

  def tabs
    @tabs = [
      OpenStruct.new(id: 'families',
                     name: Family.model_name.human(count: 2),
                     active: true,
                     value: Family.by_company(current_user.company).count),
      OpenStruct.new(id: 'family-member',
                     name: FamilyMember.model_name.human(count: 2),
                     active: false,
                     value: FamilyMember.by_company(current_user.company).count),
      OpenStruct.new(id: 'home-visit-registrations',
                     name: HomeVisitRegistration.model_name.human(count: 2),
                     active: false,
                     value: HomeVisitRegistration.by_company(current_user.company).count)
    ]
  end
end
