# frozen_string_literal: true

class ProfissionalSaudeService
  include LibXML::XML

  def consultar_profissionais_saude(obj)
    xml = Document.new
    xml.root = Node.new('prof:requestConsultarProfissionaisSaude')
    xml.root << fil_node = Node.new('fil:FiltroPesquisaEstabelecimentoSaude')

    fil_node << cnes_node = Node.new('cod:CodigoCNES')
    cnes_node << Node.new('cod:codigo', obj.cnes)

    fil_node << cnpj_node = Node.new('cnpj:CNPJ')
    cnpj_node << Node.new('cnpj:numeroCNPJ', obj.cnpj)

    xml.root.to_s
  end

  def consultar_profissional_saude(obj)
    xml = Document.new
    xml.root = Node.new('prof:requestConsultarProfissionalSaude')
    xml.root << fil_node = Node.new('fil:FiltroPesquisaProfissionalSaude')

    fil_node << cns_node = Node.new('cns:CNS')
    cns_node << Node.new('cns:numeroCNS', obj.cns)
    cns_node << Node.new('cns:dataAtribuicao', obj.data_atribuicao)
    cns_node << Node.new('cns:tipoCartao', obj.tipo_cartao)
    cns_node << Node.new('cns:manual', obj.manual)
    cns_node << Node.new('cns:justificativaManual', obj.justificativa)

    fil_node << cpf_node = Node.new('cpf:CPF')
    cpf_node << Node.new('cpf:numeroCPF', obj.cpf)

    xml.root.to_s
  end
end
