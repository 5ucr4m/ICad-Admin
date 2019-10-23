# frozen_string_literal: true

class CreateVaccinationCampaigns < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    VaccinationCampaign.create! title: 'Vacinação contra rubéula',
                                period_start: Date.today, period_end: Date.today + 60.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69,
                                company: company
    VaccinationCampaign.create! title: 'Vacinação contra sarampo', period_start: Date.today,
                                period_end: Date.today + 60.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69,
                                company: company
    VaccinationCampaign.create! title: 'Vacinação contra variola', period_start: Date.today + 1.day,
                                period_end: Date.today + 30.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69,
                                company: company
  end

  def down; end
end
