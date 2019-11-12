# frozen_string_literal: true

class CreateUsers < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    admin = User.create! email: 'administrador@icadx.com.br',
                        password: '4dmin112@@@', password_confirmation: '4dmin112@@@'
    support = User.create! email: 'suporte@icadx.com.br',
                        password: '5upport112@@@', password_confirmation: '5upport112@@@'
    admin_company = UserCompany.create(user: admin, company: company, current: true)
    support_company = UserCompany.create(user: support, company: company, current: true)
    admin_role = Role.where(role_type: 0)
    support_role = Role.where(role_type: 8)
    UserRole.create! user_company: admin_company, role: admin_role
    UserRole.create! user_company: support_company, role: support_role
  end

  def down; end
end
