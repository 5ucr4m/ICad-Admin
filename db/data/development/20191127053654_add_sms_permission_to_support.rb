# frozen_string_literal: true

class AddSmsPermissionToSupport < SeedMigration::Migration
  def up
    Role::ADMIN_SUPPORT.each do |model|
      assign_permissions(Role.admin, create_permission(model, 4))
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
