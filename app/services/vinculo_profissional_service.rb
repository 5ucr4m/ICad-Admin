# frozen_string_literal: true

require 'libxml'

class VinculoProfissionalService
  include LibXML::XML

  class << self
    def pesquisar_vinculacao_profissional_saude(obj)
      xml = Document.new
      xml.root = Node.new('vin:RequestVinculacaos')
      xml.root << fil_node = Node.new('fil:FiltroPesquisaVinculacaos')

      fil_node << fil_id_prof_node = Node.new('fil:IdentificacaoProfissional')

      fil_id_prof_node << fil_cpf_node = Node.new('fil:cpf')
      fil_cpf_node << Node.new('cpf:numeroCPF', obj.cpf)

      fil_id_prof_node << fil_cns_node = Node.new('fil:cns')
      fil_cns_node << Node.new('cns:numeroCNS', obj.cns)

      fil_node << fil_id_stab_node = Node.new('fil:IdentificacaoEstabelecimento')

      fil_id_stab_node << fil_cnes_node = Node.new('fil:cnes')
      fil_cnes_node << Node.new('cod:codigo', obj.codigo)

      fil_id_stab_node << fil_cnpj_node = Node.new('fil:cnpj')
      fil_cnpj_node << Node.new('cnpj:numeroCNPJ', obj.cnpj)

      fil_node << pag_node = Node.new('Paginacao')
      pag_node << Node.new('pag:registroInicial', obj.pag_inicial)
      pag_node << Node.new('pag:quantidadeRegistros', obj.quantidade)
      pag_node << Node.new('pag:totalRegistros', obj.total)

      xml.root.to_s
    end

    def detalhar_vinculacao_profissional_saude(obj)
      xml = Document.new
      xml.root = Node.new('vin:RequestVinculacao')
      xml.root << fil_node = Node.new('fil:FiltroPesquisaVinculacao')

      fil_node << fil_id_prof_node = Node.new('fil:IdentificacaoProfissional')
      fil_id_prof_node << fil_cpf_node = Node.new('fil:cpf')
      fil_cpf_node << Node.new('cpf:numeroCPF', obj.cpf)
      fil_id_prof_node << fil_cns = Node.new('fil:cns')
      fil_cns << Node.new('cns:numeroCNS', obj.cns)

      fil_node << fil_id_stab_node = Node.new('fil:IdentificacaoEstabelecimento')
      fil_id_stab_node << fil_cnes = Node.new('fil:cnes')
      fil_cnes << Node.new('cod:codigo', obj.cnes)
      fil_id_stab_node << fil_cnpj = Node.new('fil:cnpj')
      fil_cnpj << Node.new('cnpj:numeroCNPJ', obj.cnpj)

      fil_node << fil_id_bind_node = Node.new('fil:IdentificacaoVinculacao')
      fil_id_bind_node << Node.new('fil:tipoVinculacao', obj.tp_vinculacao)

      xml.root.to_s
    end
  end
end
