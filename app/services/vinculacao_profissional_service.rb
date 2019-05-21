# frozen_string_literal: true

require 'xml'

# app/services/vinculacao_profissional_service.rb
module VinculacaoProfissionalService
  include XML

  WSDL_HOMOLOGACAO = 'https://servicos.saude.gov.br/cnes/VinculacaoProfissionalService/v1r0'
  WSDL_PRODUCAO = 'https://servicos.saude.gov.br/cnes/VinculacaoProfissionalService/v1r0'

  NAMESPACES_HOMOLOGACAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:vin': 'http://servicos.saude.gov.br/cnes/v1r0/vinculacaoprofissionalservice',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisavinculacao',
    'xmlns:cpf': 'http://servicos.saude.gov.br/schema/corporativo/documento/v1r2/cpf',
    'xmlns:cns': 'http://servicos.saude.gov.br/schema/cadsus/v5r0/cns',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
    'xmlns:cnpj': 'http://servicos.saude.gov.br/schema/corporativo/pessoajuridica/v1r0/cnpj'
  }.freeze

  NAMESPACES_PRODUCAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:vin': 'http://servicos.saude.gov.br/cnes/v1r0/vinculacaoprofissionalservice',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisavinculacao',
    'xmlns:cpf': 'http://servicos.saude.gov.br/schema/corporativo/documento/v1r2/cpf',
    'xmlns:cns': 'http://servicos.saude.gov.br/schema/cadsus/v5r0/cns',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
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

    def pesquisar_vinculacao_profissional_saude(obj)
      xml = XML::Document.new
      xml.root = XML::Node.new('vin:RequestVinculacaos')
      xml.root << fil_node = XML::Node.new('fil:FiltroPesquisaVinculacaos')

      fil_node << fil_id_prof_node = XML::Node.new('fil:IdentificacaoProfissional')

      if obj.cpf
        fil_id_prof_node << fil_cpf_node = XML::Node.new('fil:cpf')
        fil_cpf_node << XML::Node.new('cpf:numeroCPF', obj.cpf)
      end

      if obj.cns
        fil_id_prof_node << fil_cns_node = XML::Node.new('fil:cns')
        fil_cns_node << XML::Node.new('cns:numeroCNS', obj.cns)
      end

      fil_node << fil_id_stab_node = XML::Node.new('fil:IdentificacaoEstabelecimento')

      if obj.codigo
        fil_id_stab_node << fil_cnes_node = XML::Node.new('fil:cnes')
        fil_cnes_node << XML::Node.new('cod:codigo', obj.codigo)
      end

      if obj.cnpj
        fil_id_stab_node << fil_cnpj_node = XML::Node.new('fil:cnpj')
        fil_cnpj_node << XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)
      end

      fil_node << pag_node = XML::Node.new('Paginacao')
      pag_node << XML::Node.new('pag:registroInicial', obj.pag_inicial)
      pag_node << XML::Node.new('pag:quantidadeRegistros', obj.quantidade)
      pag_node << XML::Node.new('pag:totalRegistros', obj.total) if obj.total
      xml.root
    end

    def detalhar_vinculacao_profissional_saude(obj)
      xml = XML::Document.new
      xml.root = XML::Node.new('vin:RequestVinculacao')
      xml.root << fil_node = XML::Node.new('fil:FiltroPesquisaVinculacao')

      fil_node << fil_id_prof_node = XML::Node.new('fil:IdentificacaoProfissional')

      if obj.cpf
        fil_id_prof_node << fil_cpf_node = XML::Node.new('fil:cpf')
        fil_cpf_node << XML::Node.new('cpf:numeroCPF', obj.cpf)
      end
      if obj.cns
        fil_id_prof_node << fil_cns = XML::Node.new('fil:cns')
        fil_cns << XML::Node.new('cns:numeroCNS', obj.cns)
      end

      fil_node << fil_id_stab_node = XML::Node.new('fil:IdentificacaoEstabelecimento')

      if obj.cnes
        fil_id_stab_node << fil_cnes = XML::Node.new('fil:cnes')
        fil_cnes << XML::Node.new('cod:codigo', obj.cnes)
      end
      if obj.cnpj
        fil_id_stab_node << fil_cnpj = XML::Node.new('fil:cnpj')
        fil_cnpj << XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)
      end

      fil_node << fil_id_bind_node = XML::Node.new('fil:IdentificacaoVinculacao')
      fil_id_bind_node << XML::Node.new('fil:tipoVinculacao', obj.tp_vinculacao)
      xml.root
    end
  end
end
