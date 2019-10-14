class CreateVaccines < SeedMigration::Migration
  def up
    (10..15).to_a.sample.times do
      company = Company.order('RANDOM()').first
      RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
      Vaccine.create!(
        description: "Vacina ##{Faker::Number.number(digits: 4)}",
        immunobiological: GenericModel.immunobiological.order('RANDOM()').first,
        vaccination_strategy: GenericModel.vaccination_strategies.order('RANDOM()').first,
        dose: GenericModel.doses.order('RANDOM()').first,
        lot_number: Faker::Number.number(digits: 4),
        manufacturer: Faker::Company.name,
        company: company
      )
    end
  end

  def down

  end
end
