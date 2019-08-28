class CreateVaccinationCampaigns < SeedMigration::Migration
  def up
    VaccinationCampaign.create! title: 'Vacinação contra rubéula',
                                period_start: Date.today, period_end: Date.today + 60.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69
    VaccinationCampaign.create! title: 'Vacinação contra sarampo', period_start: Date.today,
                                period_end: Date.today + 60.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69
    VaccinationCampaign.create! title: 'Vacinação contra variola', period_start: Date.today + 1.day,
                                period_end: Date.today + 30.days,
                                description: 'Vacinação', age_initial: 0, age_end: 69
  end

  def down

  end
end
