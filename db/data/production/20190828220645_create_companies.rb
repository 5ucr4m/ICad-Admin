# frozen_string_literal: true

class CreateCompanies < SeedMigration::Migration
  def up
    Company.create!(legal_full_name: Faker::Company.name,
                    fancy_name: Faker::Company.buzzword,
                    federal_registry: Faker::Company.brazilian_company_number(formatted: true),
                    state_registry: Faker::Company.brazilian_company_number[0..7],
                    patio: Faker::Address.street_address,
                    number: Faker::Number.digit,
                    zip: Faker::Address.zip,
                    reference: Faker::Lorem.word,
                    city: City.find_by(name: 'TERESINA'),
                    district: Faker::Address.community,
                    complement: Faker::Lorem.word)
  end

  def down; end
end
