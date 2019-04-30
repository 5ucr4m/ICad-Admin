# frozen_string_literal: true

require 'libxml'

# app/services/equipamento_service.rb
module EquipamentoService
  include LibXML::XML

  WSDL_HOM = 'https://servicoshm.saude.gov.br/cnes/EquipamentoService/v1r0?wsdl'
  WSDL_PRO = 'https://servicos.saude.gov.br/cnes/EquipamentoService/v1r0?wsdl'

  class << self
    def call(method, obj)
      SoapService.call(method, send(method, obj), Rails.env.development? ? WSDL_HOM : WSDL_PRO)
    end

    private

    def consulta_equipamentos(obj)
      xml = Document.new
      xml.root = Node.new('equ:requestConsultarEquipamentos')
      xml.root << cnes_node = Node.new('cod:CodigoCNES')
      cnes_node << Node.new('cod:codigo', obj.cnes)

      xml.root.to_s
    end
  end
end
