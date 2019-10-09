# frozen_string_literal: true

class CreateHealthEstablishments < SeedMigration::Migration
  def up
    State.find_by(abbreviation: 'PI').cities.each do
      5.times do
        HealthEstablishment.create!(cnes_code: Faker::Number.positive(100_000_000, 999_999_999),
                                    unit_code: Faker::Number.positive(100_000, 999_999),
                                    legal_full_name: Faker::Name.name_with_middle,
                                    fancy_name: "UBS #{Faker::Name.name_with_middle}",
                                    federal_registry: Faker::Company.brazilian_company_number(formatted: true),
                                    state_registry: Faker::Company.brazilian_company_number[0..7],
                                    manager_full_name: Faker::Name.name_with_middle,
                                    manager_federal_registry: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                                    registry_at: Faker::Date.backward,
                                    company: Company.order('RANDOM()').first)
      end
    end
  end

  def down; end
end
