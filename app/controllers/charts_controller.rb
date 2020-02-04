# frozen_string_literal: true

class ChartsController < WebController
  before_action :set_data

  def chart_families
    authorize(:chart, :chart_families?)
    render_json(@families.group_by_period(:day, :created_at,
                                          format: '%d/%m/%Y', last: 5).count)
  end

  def chart_family_members
    authorize(:chart, :chart_family_members?)
    render_json(@family_members.group_by_period(:day,
                                                :created_at,
                                                format: '%d/%m/%Y', last: 5).count)
  end

  def chart_home_visit_registrations
    authorize(:chart, :chart_home_visit_registrations?)
    render_json(@home_visit_registrations.group_by_period(:day, :updated_at,
                                                          format: '%d/%m/%Y', last: 5).count)
  end

  def chart_individual_registrations
    authorize(:chart, :chart_individual_registrations?)
    render_json(@individual_registrations.group_by_period(:day, :updated_at,
                                                          format: '%d/%m/%Y', last: 5).count)
  end

  def chart_home_registrations
    authorize(:chart, :chart_home_registrations?)
    render_json(@home_registrations.group_by_period(:day, :updated_at,
                                                    format: '%d/%m/%Y', last: 5).count)
  end

  def chart_periods
    authorize(:chart, :chart_periods?)
    render_json(Period.group_by_period(:month, :created_at,
                                       format: '%d/%m/%Y', last: 5).count)
  end

  def chart_vaccinations
    authorize(:chart, :chart_vaccinations?)
    render_json(Vaccination.group_by_period(:day, :created_at,
                                            format: '%d/%m/%Y', last: 5).count)
  end

  private

  def set_data
    @families = user.agent? ? Family.unscoped.where(user: user) : Family.unscoped.all
    @family_members = user.agent? ? FamilyMember.unscoped.where(user: user) : FamilyMember.unscoped.all
    @home_registrations = user.agent? ? HomeRegistration.unscoped.where(user: user) : HomeRegistration.unscoped.all
    @home_visit_registrations = user.agent? ? HomeVisitRegistration.unscoped.where(user: user) : HomeVisitRegistration.unscoped.all
    @individual_registrations = user.agent? ? IndividualRegistration.unscoped.where(user: user) : HomeVisitRegistration.unscoped.all
  end
end
