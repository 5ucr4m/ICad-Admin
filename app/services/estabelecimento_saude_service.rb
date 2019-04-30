# frozen_string_literal: true

require 'libxml'

module EstabelecimentoSaudeService
  include LibXML::XML

  WSDL_HOM = 'https://servicoshm.saude.gov.br/cnes/LeitoService/v1r0?wsdl'
  WSDL_PRO = 'https://servicos.saude.gov.br/cnes/LeitoService/v1r0?wsdl'

  class << self
    def call(method, obj)
      SoapService.call(method, send(method, obj), Rails.env.development? ? WSDL_HOM : WSDL_PRO)
    end

    private

    def consulta_estabelecimento_saude(obj)
      xml = Document.new
      xml.root = Node.new('est:requestConsultarEstabelecimentoSaude')
      xml.root << fil_node = Node.new('fil:FiltroPesquisaEstabelecimentoSaude')

      fil_node << cnes_node = Node.new('cod:CodigoCNES')
      cnes_node << Node.new('cod:codigo', obj.cnes)

      fil_node << cnpj_node = Node.new('cnpj:CNPJ')
      cnpj_node << Node.new('cnpj:numeroCNPJ', obj.cnpj)

      xml.root.to_s
    end

    def localizar_estabelecimento_saude(obj)
      xml = Document.new
      xml.root = Node.new('est:requestLocalizarEstabelecimentoSaude')
      xml.root << fil_node = Node.new('fil:FiltroLocalizacaoEstabelecimentoSaude')

      fil_node << loc_node = Node.new('loc:Localizacao')
      loc_node << Node.new('loc:longitude', obj.longitude)
      loc_node << Node.new('loc:latitude', obj.latitude)
      loc_node << Node.new('loc:geoJson', obj.geojson)

      fil_node << tip_node = Node.new('tip:tipoUnidade')
      tip_node << Node.new('tip:codigo', obj.codigo)
      tip_node << Node.new('tip:descricao', obj.descricao)

      fil_node << pag_node = Node.new('pag:Paginacao')
      pag_node << Node.new('pag:posicaoRegistroInicio', obj.pag_inicial)
      pag_node << Node.new('pag:quantidadeRegistrosPorPagina', obj.pag_pagina)
      pag_node << Node.new('pag:quantidadeRegistros', obj.total)

      xml.root.to_s
    end

    def consultar_pre_cadastro_cnes(obj)
      xml = Document.new
      xml.root = Node.new('est:requestConsultarPrecadastroCNES')
      xml.root << fil_node = Node.new('fil:FiltroPesquisaPrecadastroCnes')

      fil_node << cnes_node = Node.new('cod:CodigoCNES')
      cnes_node << Node.new('cod:codigo', obj.cnes)

      fil_node << Node.new('fil:situacao', obj.situation)

      xml.root.to_s
    end
  end
end
