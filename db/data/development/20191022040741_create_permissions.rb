# frozen_string_literal: true

class CreatePermissions < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    Role::REGISTRIES.each do |model|
      assign_permissions(Role.admin, create_permission(model, 1))
      assign_permissions(Role.secretary, create_permission(model, 1))
      assign_permissions(Role.support, create_permission(model, 1))
    end
    Role::AGENT_FORMS.each do |model|
      assign_permissions(Role.admin, create_permission(model, 2))
      assign_permissions(Role.support, create_permission(model, 2))
      assign_permissions(Role.agent, create_permission(model, 2))
      assign_permissions(Role.secretary, create_permission(model, 2))
    end
    Role::OTHER_FORMS.each do |model|
      assign_permissions(Role.admin, create_permission(model, 2))
      assign_permissions(Role.support, create_permission(model, 2))
      assign_permissions(Role.secretary, create_permission(model, 2))
    end
    Role::REPORTS.each do |model|
      assign_permissions(Role.admin, create_permission(model, 3))
      assign_permissions(Role.secretary, create_permission(model, 3))
      assign_permissions(Role.mayor, create_permission(model, 3))
      assign_permissions(Role.support, create_permission(model, 3))
    end
    Role::ADMIN_CONFIGURATION.each do |model|
      assign_permissions(Role.admin, create_permission(model, 4))
    end
    Role::USER_CONFIGURATION.each do |model|
      assign_permissions(Role.support, create_permission(model, 4))
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

  def assign_permissions(role, permission)
    return if role.first.permissions.include?(permission)

    role.first.permissions << permission
  end
end
