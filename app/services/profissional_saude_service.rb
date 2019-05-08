# frozen_string_literal: true

require 'xml'

# app/services/profissional_saude_service.rb
class ProfissionalSaudeService
  include XML

  URL_HOMOLOGACAO = 'https://servicos.saude.gov.br/cnes/ProfissionalSaudeService/v1r0'
  URL_PRODUCAO = 'https://servicos.saude.gov.br/cnes/ProfissionalSaudeService/v1r0'

  NAMESPACES_HOMOLOGACAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:tns': 'http://servicos.saude.gov.br/cnes/v1r0/profissionalsaudeservice',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisaestabelecimentosaude',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
    'xmlns:cns': 'http://servicos.saude.gov.br/schema/cadsus/v5r0/cns',
    'xmlns:cpf': 'http://servicos.saude.gov.br/schema/corporativo/documento/v1r2/cpf',
    'xmlns:cnpj': 'http://servicos.saude.gov.br/schema/corporativo/pessoajuridica/v1r0/cnpj'
  }.freeze

  NAMESPACES_PRODUCAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:tns': 'http://servicos.saude.gov.br/cnes/v1r0/profissionalsaudeservice',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisaestabelecimentosaude',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
    'xmlns:cns': 'http://servicos.saude.gov.br/schema/cadsus/v5r0/cns',
    'xmlns:cpf': 'http://servicos.saude.gov.br/schema/corporativo/documento/v1r2/cpf',
    'xmlns:cnpj': 'http://servicos.saude.gov.br/schema/corporativo/pessoajuridica/v1r0/cnpj'
  }.freeze

  class << self

    def call(operation, obj)
      urls = if Rails.env.development?
               [URL_HOMOLOGACAO, NAMESPACES_HOMOLOGACAO]
             else
               [URL_PRODUCAO, NAMESPACES_PRODUCAO]
             end
      request = OpenStruct.new(operation: operation, url: urls[0],
                               body: send(operation, obj), namespaces: urls[1])
      SoapService.call(request)
    end

    private

    def consultar_profissionais_saude(obj)
      xml = XML::Node.new('tns:requestConsultarProfissionaisSaude')
      xml << fil_node = XML::Node.new('fil:FiltroPesquisaEstabelecimentoSaude')
      if obj.cnes
        fil_node << cnes_node = XML::Node.new('cod:CodigoCNES')
        cnes_node << XML::Node.new('cod:codigo', obj.cnes)
      end
      if obj.cnpj
        fil_node << cnpj_node = XML::Node.new('cnpj:CNPJ')
        cnpj_node << XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)
      end
      xml
    end

    def consultar_profissional_saude(obj)
      xml = XML::Node.new('tns:requestConsultarProfissionalSaude')
      xml << fil_node = XML::Node.new('fil:FiltroPesquisaProfissionalSaude')
      if obj.cns
        fil_node << cns_node = XML::Node.new('cns:CNS')
        cns_node << XML::Node.new('cns:numeroCNS', obj.cns)
        cns_node << XML::Node.new('cns:dataAtribuicao', obj.data_atribuicao) if obj.data_atribuicao
        cns_node << XML::Node.new('cns:tipoCartao', obj.tipo_cartao) if obj.tipo_cartao
        cns_node << XML::Node.new('cns:manual', obj.manual) if obj.manual
        cns_node << XML::Node.new('cns:justificativaManual', obj.justificativa) if obj.justificativa
      end
      if obj.cpf
        fil_node << cpf_node = XML::Node.new('cpf:CPF')
        cpf_node << XML::Node.new('cpf:numeroCPF', obj.cpf)
      end
      xml
    end
  end
end
