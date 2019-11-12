# frozen_string_literal: true

class CreatePermissions < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    Role::REGISTRIES.each do |model| # Cadastros básicos
      assign_permissions(Role.admin, create_permission(model, 1)) # Admin
      assign_permissions(Role.secretary, create_permission(model, 1)) # Secretariado
      assign_permissions(Role.support, create_permission(model, 1)) # TI
    end
    Role::AGENT_FORMS.each do |model| # Fichas agente
      assign_permissions(Role.admin, create_permission(model, 2)) # Admin
      assign_permissions(Role.support, create_permission(model, 2)) # TI
      assign_permissions(Role.agent, create_permission(model, 2)) # Agente
      assign_permissions(Role.secretary, create_permission(model, 2)) # Secretariado
    end
    Role::OTHER_FORMS.each do |model| # Ficha vacinação
      assign_permissions(Role.admin, create_permission(model, 2)) # Admin
      assign_permissions(Role.support, create_permission(model, 2)) # TI
      assign_permissions(Role.secretary, create_permission(model, 2)) # Secretariado
      assign_permissions(Role.doctor, create_permission(model, 2)) # Doutor
      assign_permissions(Role.nurse, create_permission(model, 2)) # Enfermeira
      assign_permissions(Role.agent, create_permission(model, 2)) # Agente
      assign_permissions(Role.nurse_aux, create_permission(model, 2)) # Aux enfermeira
    end
    Role::REPORTS.each do |model| # Relatórios
      assign_permissions(Role.admin, create_permission(model, 3))
      assign_permissions(Role.secretary, create_permission(model, 3))
      assign_permissions(Role.mayor, create_permission(model, 3))
      assign_permissions(Role.agent, create_permission(model, 3))
      assign_permissions(Role.support, create_permission(model, 3))
      assign_permissions(Role.nurse, create_permission(model, 3))
      assign_permissions(Role.doctor, create_permission(model, 3))
      assign_permissions(Role.nurse_aux, create_permission(model, 3))
      assign_permissions(Role.dentist, create_permission(model, 3))
      assign_permissions(Role.dentist_aux, create_permission(model, 3))
    end
    Role::ADMIN_CONFIGURATION.each do |model| # Configuração
      assign_permissions(Role.admin, create_permission(model, 4)) # Admin
    end
    Role::USER_CONFIGURATION.each do |model| # Configuração usuário
      assign_permissions(Role.support, create_permission(model, 4)) # TI
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
    return if role.permissions.include?(permission)

    role.role_permissions.build(permission)
  end
end
