# frozen_string_literal: true

class CreateUsers < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id

    admin = User.create!(email: 'administrador@icadx.com.br', password: '4dmin112@@@', password_confirmation: '4dmin112@@@')
    support = User.create!(email: 'suporte@icadx.com.br', password: '5upport112@@@', password_confirmation: '5upport112@@@')
    agent = User.create!(email: 'agente@icadx.com.br', password: '4gent112@@@', password_confirmation: '4gent112@@@')
    citizen = User.create!(email: 'cidadao@icadx.com.br', password: '6itizen112@@@', password_confirmation: '6itizen112@@@')
    doctor = User.create!(email: 'doutor@icadx.com.br', password: '4octor112@@@', password_confirmation: '4octor112@@@')
    service = User.create!(email: 'atendimento@icadx.com.br', password: '4tend112@@@', password_confirmation: '4tend112@@@')

    admin_company = UserCompany.create!(user: admin, company: company, current: true, current_module: 0)
    support_company = UserCompany.create!(user: support, company: company, current: true, current_module: 0)
    agent_company = UserCompany.create!(user: agent, company: company, current: true, current_module: 0)
    citizen_company = UserCompany.create!(user: citizen, company: company, current: true, current_module: 0)
    doctor_company = UserCompany.create!(user: doctor, company: company, current: true, current_module: 0)
    service_company = UserCompany.create!(user: service, company: company, current: true, current_module: 1)

    UserRole.create!(user_company: admin_company, role: Role.admin.first)
    UserRole.create!(user_company: support_company, role: Role.support.first)
    UserRole.create!(user_company: agent_company, role: Role.agent.first)
    UserRole.create!(user_company: citizen_company, role: Role.citizen.first)
    UserRole.create!(user_company: doctor_company, role: Role.doctor.first)
    UserRole.create!(user_company: service_company, role: Role.service.first)
  end

  def down; end
end
