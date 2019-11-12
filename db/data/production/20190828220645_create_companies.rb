# frozen_string_literal: true

class CreateCompanies < SeedMigration::Migration
  def up
    Company.create!(legal_full_name: 'EMPRESA ADMINISTRAÇÃO',
                    fancy_name: 'ADMIN',
                    federal_registry: '00000000000000',
                    state_registry: '0000000000',
                    city: City.find_by(name: 'TERESINA'))
  end

  def down; end
end
