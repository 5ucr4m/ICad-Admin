# frozen_string_literal: true

class CreateRoles < SeedMigration::Migration
  def up
    Role.create! name: 'Administrador', description: 'Administrador do Sistema', role_type: 'admin'
    Role.create! name: 'Prefeito', description: 'Prefeito', role_type: 'mayor'
    Role.create! name: 'Médico', description: 'Médico', role_type: 'doctor'
    Role.create! name: 'Enfermeira', description: 'Enfermeira', role_type: 'nurse'
    Role.create! name: 'Auxiliar de Enfermagem', description: 'Auxiliar de Enfermagem', role_type: 'nurse_aux'
    Role.create! name: 'Agente de Saúde', description: 'Agente de Saúde', role_type: 'agent'
    Role.create! name: 'Dentista', description: 'Dentista', role_type: 'dentist'
    Role.create! name: 'Auxiliar de Consultório Dentário', description: 'Auxiliar de Consultório Dentário', role_type: 'dentist_aux'
  end

  def down; end
end
