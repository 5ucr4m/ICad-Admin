# frozen_string_literal: true

class CreatePermissions < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    Role::REGISTRIES.each do |model|
      create_permission model, 1
    end
    Role::FORMS.each do |model|
      create_permission model, 2
    end
    Role::REPORTS.each do |model|
      create_permission model, 3
    end
    Role::CONFIGURATION.each do |model|
      create_permission model, 4
    end
    Role::ADMIN.each do |model|
      create_permission model, 5
    end
  end

  def down; end

  private

  def create_permission(model, reference)
    Permission.create!(
      model_reference: model.to_s,
      app_module: GenericModel.app_modules.find_by(reference: reference)
    )
  end
end
