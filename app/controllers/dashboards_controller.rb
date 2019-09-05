# frozen_string_literal: true

class DashboardsController < WebController
  before_action :tabs

  def dashboard; end

  private

  def tabs
    @tabs = [
      OpenStruct.new(id: 'families',
                     name: Family.model_name.human(count: 2),
                     active: true,
                     value: Family.count),
      OpenStruct.new(id: 'family-member',
                     name: FamilyMember.model_name.human(count: 2),
                     active: false,
                     value: FamilyMember.count),
      OpenStruct.new(id: 'home-visit-registrations',
                     name: HomeVisitRegistration.model_name.human(count: 2),
                     active: false,
                     value: HomeVisitRegistration.count)
    ]
  end
end
