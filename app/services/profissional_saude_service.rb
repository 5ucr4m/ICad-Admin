# frozen_string_literal: true

require 'libxml'

# app/services/profissional_saude_service.rb
class ProfissionalSaudeService

  WSDL_HOM = 'https://servicoshm.saude.gov.br/cnes/ProfissionalSaudeService/v1r0?wsdl'
  WSDL_PRO = 'https://servicos.saude.gov.br/cnes/ProfissionalSaudeService/v1r0?wsdl'

  class << self
    def call(method, obj)
      SoapService.call(method, send(method, obj), Rails.env.development? ? WSDL_HOM : WSDL_PRO)
    end

    private

    def consultar_profissionais_saude(obj)
      xml = LibXML::XML::Document.new
      xml.root = LibXML::XML::Node.new('prof:requestConsultarProfissionaisSaude')
      xml.root << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaEstabelecimentoSaude')

      fil_node << cnes_node = LibXML::XML::Node.new('cod:CodigoCNES')
      cnes_node << LibXML::XML::Node.new('cod:codigo', obj.cnes)

      fil_node << cnpj_node = LibXML::XML::Node.new('cnpj:CNPJ')
      cnpj_node << LibXML::XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)

      xml.root
    end

    def consultar_profissional_saude(obj)
      xml = Document.new
      xml.root = LibXML::XML::Node.new('prof:requestConsultarProfissionalSaude')
      xml.root << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaProfissionalSaude')

      fil_node << cns_node = LibXML::XML::Node.new('cns:CNS')
      cns_node << LibXML::XML::Node.new('cns:numeroCNS', obj.cns)
      cns_node << LibXML::XML::Node.new('cns:dataAtribuicao', obj.data_atribuicao)
      cns_node << LibXML::XML::Node.new('cns:tipoCartao', obj.tipo_cartao)
      cns_node << LibXML::XML::Node.new('cns:manual', obj.manual)
      cns_node << LibXML::XML::Node.new('cns:justificativaManual', obj.justificativa)

      fil_node << cpf_node = LibXML::XML::Node.new('cpf:CPF')
      cpf_node << LibXML::XML::Node.new('cpf:numeroCPF', obj.cpf)

      xml.root
    end
  end
end
