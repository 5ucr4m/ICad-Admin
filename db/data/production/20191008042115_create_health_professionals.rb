# frozen_string_literal: true

class CreateHealthProfessionals < SeedMigration::Migration
  def up
    User.all.each do |user|
      pft = ProfessionalTeam.order('RANDOM()').first
      RailsMultitenant::GlobalContextRegistry[:company_id] = pft.company.id
      puts "COMPANY: #{pft.company.inspect}\n"
      @hp = HealthProfessional.create!(cns_code: Faker::Company.brazilian_company_number[0..8],
                                       cbo_code: GenericModel.cbo_types.order('RANDOM()').first,
                                       cnes_code: Faker::Company.brazilian_company_number[0..8],
                                       professional_team: pft,
                                       legal_full_name: Faker::Name.name_with_middle,
                                       fancy_name: Faker::Name.first_name,
                                       federal_registry: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                                       state_registry: Faker::IDNumber.brazilian_rg,
                                       health_establishment: HealthEstablishment.where(company: pft.company)
                                                               .order('RANDOM()').first,
                                       company: pft.company)
      user.health_professional = @hp
    end
  end

  def down; end
end
