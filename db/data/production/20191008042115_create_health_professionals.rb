# frozen_string_literal: true

class CreateHealthProfessionals < SeedMigration::Migration
  def up
    User.all.each do |user|
      RailsMultitenant::GlobalContextRegistry[:company_id] = Company.first.id
      pft = ProfessionalTeam.all.order('RANDOM()').first
      @hp = HealthProfessional.create!(cns_code: Faker::Company.brazilian_company_number[0..8],
                                       cbo_code: GenericModel.cbo_types.order('RANDOM()').first,
                                       professional_team: pft,
                                       full_name: Faker::Name.name_with_middle,
                                       federal_registry: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                                       state_registry: Faker::IDNumber.brazilian_rg,
                                       company: pft.company)
      user.health_professional = @hp
    end
  end

  def down; end
end
