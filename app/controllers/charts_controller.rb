# frozen_string_literal: true

class ChartsController < WebController
  def chart_families
    render_json Family.by_company(current_user.company)
                      .group_by_period(:day, :created_at,
                                       format: '%d/%m/%Y', last: 5).count
  end

  def chart_family_members
    render_json FamilyMember.group_by_period(:day,
                                             :created_at,
                                             format: '%d/%m/%Y', last: 5).count
  end

  def chart_home_visit_registrations
    render_json HomeVisitRegistration.by_company(current_user.company)
                                     .group_by_period(:day, :updated_at,
                                                      format: '%d/%m/%Y', last: 5).count
  end
end
