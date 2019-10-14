# frozen_string_literal: true

class CreateProfessionalTeams < SeedMigration::Migration
  def up
    HealthEstablishment.all.each do |he|
      RailsMultitenant::GlobalContextRegistry[:company_id] = he.company.id
      5.times do
        ProfessionalTeam.create!(name: Faker::Team.name,
                                 code: Faker::IDNumber.valid,
                                 company: he.company, active: [0, 1].sample)
      end
    end
  end

  def down; end
end
