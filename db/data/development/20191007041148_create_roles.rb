# frozen_string_literal: true

class CreateRoles < SeedMigration::Migration
  def up
    Role.create! name: 'Administrador', description: 'Administrador do Sistema', role_type: 'admin', admin: true
    Role.create! name: 'Prefeito', description: 'Prefeito', role_type: 'mayor', admin: false
    Role.create! name: 'Secretário(a)', description: 'Secretário(a)', role_type: 'secretary', admin: false
    Role.create! name: 'Médico', description: 'Médico', role_type: 'doctor', admin: false
    Role.create! name: 'Enfermeira', description: 'Enfermeira', role_type: 'nurse', admin: false
    Role.create! name: 'Auxiliar de Enfermagem', description: 'Auxiliar de Enfermagem', role_type: 'nurse_aux', admin: false
    Role.create! name: 'Agente de Saúde', description: 'Agente de Saúde', role_type: 'agent', admin: false
    Role.create! name: 'Dentista', description: 'Dentista', role_type: 'dentist', admin: false
    Role.create! name: 'Auxiliar de Consultório Dentário', description: 'Auxiliar de Consultório Dentário', role_type: 'dentist_aux', admin: false
    Role.create! name: 'Suporte', description: 'Suporte do Sistema', role_type: 'support', admin: false
  end

  def down; end
end
