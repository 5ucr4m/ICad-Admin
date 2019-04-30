# frozen_string_literal: true

require 'libxml'

module BedService
  include LibXML::XML

  WSDL_HOM = 'https://servicoshm.saude.gov.br/cnes/EquipamentoService/v1r0?wsdl'
  WSDL_PRO = 'https://servicos.saude.gov.br/cnes/EquipamentoService/v1r0?wsdl'

  class << self
    private

    def consultar_leitos_cnes(object)
      xml = Document.new
      xml.root = Node.new('leit:requestConsultarLeitosCNES')
      xml.root << cnes_node = Node.new('cod:CodigoCNES')
      cnes_node << Node.new('cod:codigo', object.cnes)

      xml.root.to_s
    end
  end
end
