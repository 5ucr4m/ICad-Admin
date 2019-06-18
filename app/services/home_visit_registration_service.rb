# frozen_string_literal: true

module HomeVisitRegistrationService
  include XML

  NAMESPACES = {
    'xmlns:ns2': 'http://esus.ufsc.br/dadoinstalacao',
    'xmlns:ns3': 'http://esus.ufsc.br/dadotransporte',
    'xmlns:ns4': 'http://esus.ufsc.br/fichavisitadomiciliarmaster'
  }.freeze

  class << self
    def export(data)
      home_visit_registration = data.registrable

      xml = XML::Node.new('ns3:dadoTransporteTransportXml')
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid)
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference)
      xml << XML::Node.new('codIbge', data.family_member.city.ibge_code)
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes)
      xml << XML::Node.new('numLote', data.lot_number)

      xml << vd = XML::Node.new('ns4:fichaVisitaDomiciliarMasterTransport')
      vd << XML::Node.new('uuidFicha', data.uuid)
      vd << XML::Node.new('tpCdsOrigem', 3)

      vd << ht = XML::Node.new('headerTransport')
      ht << XML::Node.new('profissionalCNS', data.family_member.family
                                               .home_registration.health_professional.cns_code)
      ht << XML::Node.new('cboCodigo_2002', data.lot_number)
      ht << XML::Node.new('cnes', data.lot_number)
      ht << XML::Node.new('dataAtendimento', data.lot_number)
      ht << XML::Node.new('codigoIbgeMunicipio', data.lot_number)
    end
  end
end
