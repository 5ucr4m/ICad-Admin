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

    UserRole.create!(company: company, user: admin, role: Role.admin.first, current_company: true, current_module: 0)
    UserRole.create!(company: company, user: support, role: Role.support.first, current_company: true, current_module: 0)
    UserRole.create!(company: company, user: agent, role: Role.agent.first, current_company: true, current_module: 0)
    UserRole.create!(company: company, user: citizen, role: Role.citizen.first, current_company: true, current_module: 0)
    UserRole.create!(company: company, user: doctor, role: Role.doctor.first, current_company: true, current_module: 1)
    UserRole.create!(company: company, user: service, role: Role.service.first, current_company: true, current_module: 1)
  end

  def down; end
end
