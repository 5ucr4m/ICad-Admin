# frozen_string_literal: true

require 'libxml'

# app/services/estabelecimento_saude_service.rb
module EstabelecimentoSaudeService

  URL_HOMOLOGACAO = 'https://servicos.saude.gov.br/cnes/EstabelecimentoSaudeService/v1r0'
  URL_PRODUCAO = 'https://servicos.saude.gov.br/cnes/EstabelecimentoSaudeService/v1r0'

  NAMESPACES_HOMOLOGACAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:tns': 'http://servicos.saude.gov.br/cnes/v1r0/estabelecimentosaudeservice',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisaestabelecimentosaude',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
    'xmlns:cnpj': 'http://servicos.saude.gov.br/schema/corporativo/pessoajuridica/v1r0/cnpj'
  }.freeze

  NAMESPACES_PRODUCAO = {
    'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
    'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
    'xmlns:tns': 'http://servicos.saude.gov.br/cnes/v1r0/estabelecimentosaudeservice',
    'xmlns:soap': 'http://www.w3.org/2003/05/soap-envelope',
    'xmlns:fil': 'http://servicos.saude.gov.br/wsdl/mensageria/v1r0/filtropesquisaestabelecimentosaude',
    'xmlns:cod': 'http://servicos.saude.gov.br/schema/cnes/v1r0/codigocnes',
    'xmlns:cnpj': 'http://servicos.saude.gov.br/schema/corporativo/pessoajuridica/v1r0/cnpj'
  }.freeze

  class << self
    include LibXML

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

    def consultar_estabelecimento_saude(obj)
      xml = LibXML::XML::Node.new('tns:requestConsultarEstabelecimentoSaude')
      xml << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaEstabelecimentoSaude')
      if obj.cnes
        fil_node << cnes_node = LibXML::XML::Node.new('cod:CodigoCNES')
        cnes_node << LibXML::XML::Node.new('cod:codigo', obj.cnes)
      end
      if obj.cnpj
        fil_node << cnpj_node = LibXML::XML::Node.new('cnpj:CNPJ')
        cnpj_node << LibXML::XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)
      end
      xml
    end

    def localizar_estabelecimento_saude(obj)
      xml = LibXML::XML::Node.new('tns:requestLocalizarEstabelecimentoSaude')
      xml << fil_node = LibXML::XML::Node.new('fil:FiltroLocalizacaoEstabelecimentoSaude')

      fil_node << loc_node = LibXML::XML::Node.new('loc:Localizacao')
      loc_node << LibXML::XML::Node.new('loc:longitude', obj.longitude)
      loc_node << LibXML::XML::Node.new('loc:latitude', obj.latitude)
      loc_node << LibXML::XML::Node.new('loc:geoJson', obj.geojson) if obj.geojson

      fil_node << tip_node = LibXML::XML::Node.new('tip:tipoUnidade')
      tip_node << LibXML::XML::Node.new('tip:codigo', obj.codigo)
      tip_node << LibXML::XML::Node.new('tip:descricao', obj.descricao) if obj.descricao

      if obj.pag_inicial
        fil_node << pag_node = LibXML::XML::Node.new('pag:Paginacao')
        pag_node << LibXML::XML::Node.new('pag:posicaoRegistroInicio', obj.pag_inicial)
        pag_node << LibXML::XML::Node.new('pag:quantidadeRegistrosPorPagina', obj.pag_pagina)
        pag_node << LibXML::XML::Node.new('pag:quantidadeRegistros', obj.total) if obj.total
      end
      xml
    end

    def consultar_pre_cadastro_cnes(obj)
      xml = LibXML::XML::Node.new('est:requestConsultarPrecadastroCNES')
      xml << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaPrecadastroCnes')

      if obj.cnes
        fil_node << cnes_node = LibXML::XML::Node.new('cod:CodigoCNES')
        cnes_node << LibXML::XML::Node.new('cod:codigo', obj.cnes)
      end
      fil_node << LibXML::XML::Node.new('fil:situacao', obj.situacao) if obj.situacao
      xml
    end
  end
end
