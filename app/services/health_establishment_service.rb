# frozen_string_literal: true

# app/services/health_professional_service.rb
class HealthEstablishmentService

  class << self

    def get_health_establishment(obj)
      params = OpenStruct.new(cnes: obj.cnes_number)
      he = EstabelecimentoSaudeService.call('consultar_estabelecimento_saude', params)

      return if he.blank? || he['Fault']

      he['responseConsultarEstabelecimentoSaude']['DadosGeraisEstabelecimentoSaude']
    end
  end
end
