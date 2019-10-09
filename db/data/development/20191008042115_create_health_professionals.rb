class CreateHealthProfessionals < SeedMigration::Migration
  def up
    User.all.each do |user|
      HealthEstablishment.where(company: user.company).each do |he|
        HealthProfessional.create!(cns_code: Faker::Company.brazilian_company_number[0..8],
                                   cbo_code: GenericModel.cbo_types.order('RANDOM()').first,
                                   cnes_code: he.cnes_code,
                                   legal_full_name: Faker::Name.name_with_middle,
                                   fancy_name: Faker::Name.first_name,
                                   federal_registry: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                                   state_registry: Faker::IDNumber.brazilian_rg,
                                   health_establishment: he,
                                   company: user.company)
      end
    end
  end

  def down

  end
end
