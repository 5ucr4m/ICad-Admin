# frozen_string_literal: true

class CreateUsers < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id

    admin = User.create!(email: 'administrador@icadx.com.br', password: '4dmin112@@@', password_confirmation: '4dmin112@@@')
    support = User.create!(email: 'suporte@icadx.com.br', password: '5upport112@@@', password_confirmation: '5upport112@@@')
    agent = User.create!(email: 'agente@icadx.com.br', password: '4gent112@@@', password_confirmation: '4gent112@@@')
    citizen = User.create!(email: 'cidadao@icadx.com.br', password: '6itizen112@@@', password_confirmation: '6itizen112@@@')

    admin_company = UserCompany.create!(user: admin, company: company, current: true)
    support_company = UserCompany.create!(user: support, company: company, current: true)
    agent_company = UserCompany.create!(user: agent, company: company, current: true)
    citizen_company = UserCompany.create!(user: citizen, company: company, current: true)

    UserRole.create!(user_company: admin_company, role: Role.admin.first)
    UserRole.create!(user_company: support_company, role: Role.support.first)
    UserRole.create!(user_company: agent_company, role: Role.agent.first)
    UserRole.create!(user_company: citizen_company, role: Role.citizen.first)
  end

  def down; end
end
