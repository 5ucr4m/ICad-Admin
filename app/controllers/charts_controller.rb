# frozen_string_literal: true

class ChartsController < WebController
  def chart_families
    render_json Family.group_by_period(:day, :created_at,
                                       format: '%d/%m/%Y', last: 5).count
  end

  def chart_family_members
    render_json FamilyMember.group_by_period(:day,
                                             :created_at,
                                             format: '%d/%m/%Y', last: 5).count
  end

  def chart_home_visit_registrations
    render_json HomeVisitRegistration.group_by_period(:day, :updated_at,
                                                      format: '%d/%m/%Y', last: 5).count
  end

  def chart_periods
    render_json Period.group_by_period(:month, :created_at,
                                                      format: '%d/%m/%Y', last: 5).count
  end

  def chart_vaccinations
    render_json Vaccination.group_by_period(:day, :created_at,
                                 format: '%d/%m/%Y', last: 5).count
  end
end
