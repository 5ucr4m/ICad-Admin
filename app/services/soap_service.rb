# frozen_string_literal: true

require 'xml'

class SoapService
  include LibXML

  def consult_establishment_hearth(_cns)
    codigo_node = build_node('cod:codigo')
    cns_node = build_node('cod:CodigoCNES')
    filtro_node = build_node('fil:FiltroPesquisaEstabelecimentoSaude')
    request_node = build_node('est:requestConsultarEstabelecimentoSaude')
  end

  private

  def soap_method(cns_code); end

  def soap_request(body, wsdl)
    client = Savon::Client.new(wsdl: wsdl,
                               soap_version: 2,
                               namespace_identifier: nil,
                               ssl_verify_mode: :none,
                               convert_request_keys_to: :none,
                               log: true,
                               env_namespace: :soap12,
                               pretty_print_xml: true)
    client.call(wsdl.to_sym, xml: body)
  end

  def create_xml(name, content)
    xml = XML::Document.new
    node = XML::Node.new(name)
    node.content = content
    xml.root = node
    xml
  end

  def build_node(name)
    XML::Node.new(name)
  end
end
