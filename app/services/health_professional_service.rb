# frozen_string_literal: true

# app/services/health_professional_service.rb
class HealthProfessionalService
  class << self
    def get_health_professional(cnes_code)
      params = OpenStruct.new(cnes: cnes_code)
      hp = ProfissionalSaudeService.call('consultar_profissionais_saude', params)

      return if hp.blank? || hp['Fault']

      list = hp['responseConsultarProfissionaisSaude']['ProfissionalSaude']
      list.select { |p| p['CNS']['numeroCNS'] == obj.cns_code }.first
    end
  end
end
