# frozen_string_literal: true

require 'libxml'

# app/services/vinculacao_profissional_service.rb
class VinculacaoProfissionalService

  WSDL_HOM = 'https://servicoshm.saude.gov.br/cnes/VinculacaoProfissionalService/v1r0?wsdl'
  WSDL_PRO = 'https://servicos.saude.gov.br/cnes/VinculacaoProfissionalService/v1r0?wsdl'

  class << self
    def call(method, obj)
      # SoapService.call(method, send(method, obj), Rails.env.development? ? WSDL_HOM : WSDL_PRO)
    end

    private

    def pesquisar_vinculacao_profissional_saude(obj)
      xml = LibXML::XML::Document.new
      xml.root = LibXML::XML::Node.new('vin:RequestVinculacaos')
      xml.root << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaVinculacaos')

      fil_node << fil_id_prof_node = LibXML::XML::Node.new('fil:IdentificacaoProfissional')

      fil_id_prof_node << fil_cpf_node = LibXML::XML::Node.new('fil:cpf')
      fil_cpf_node << LibXML::XML::Node.new('cpf:numeroCPF', obj.cpf)

      fil_id_prof_node << fil_cns_node = LibXML::XML::Node.new('fil:cns')
      fil_cns_node << LibXML::XML::Node.new('cns:numeroCNS', obj.cns)

      fil_node << fil_id_stab_node = LibXML::XML::Node.new('fil:IdentificacaoEstabelecimento')

      fil_id_stab_node << fil_cnes_node = LibXML::XML::Node.new('fil:cnes')
      fil_cnes_node << LibXML::XML::Node.new('cod:codigo', obj.codigo)

      fil_id_stab_node << fil_cnpj_node = LibXML::XML::Node.new('fil:cnpj')
      fil_cnpj_node << LibXML::XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)

      fil_node << pag_node = LibXML::XML::Node.new('Paginacao')
      pag_node << LibXML::XML::Node.new('pag:registroInicial', obj.pag_inicial)
      pag_node << LibXML::XML::Node.new('pag:quantidadeRegistros', obj.quantidade)
      pag_node << LibXML::XML::Node.new('pag:totalRegistros', obj.total)

      xml.root
    end

    def detalhar_vinculacao_profissional_saude(obj)
      xml = Document.new
      xml.root = LibXML::XML::Node.new('vin:RequestVinculacao')
      xml.root << fil_node = LibXML::XML::Node.new('fil:FiltroPesquisaVinculacao')

      fil_node << fil_id_prof_node = LibXML::XML::Node.new('fil:IdentificacaoProfissional')
      fil_id_prof_node << fil_cpf_node = LibXML::XML::Node.new('fil:cpf')
      fil_cpf_node << LibXML::XML::Node.new('cpf:numeroCPF', obj.cpf)
      fil_id_prof_node << fil_cns = LibXML::XML::Node.new('fil:cns')
      fil_cns << LibXML::XML::Node.new('cns:numeroCNS', obj.cns)

      fil_node << fil_id_stab_node = LibXML::XML::Node.new('fil:IdentificacaoEstabelecimento')
      fil_id_stab_node << fil_cnes = LibXML::XML::Node.new('fil:cnes')
      fil_cnes << LibXML::XML::Node.new('cod:codigo', obj.cnes)
      fil_id_stab_node << fil_cnpj = LibXML::XML::Node.new('fil:cnpj')
      fil_cnpj << LibXML::XML::Node.new('cnpj:numeroCNPJ', obj.cnpj)

      fil_node << fil_id_bind_node = LibXML::XML::Node.new('fil:IdentificacaoVinculacao')
      fil_id_bind_node << LibXML::XML::Node.new('fil:tipoVinculacao', obj.tp_vinculacao)

      xml.root
    end
  end
end
