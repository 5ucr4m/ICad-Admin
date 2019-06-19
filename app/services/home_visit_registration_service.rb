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

      home_visit_registration.home_visit_forms.each do |hvf|
        vd << form = XML::Node.new('visitasDomiciliares')
        form << XML::Node.new('turno', hvf.turn.reference)
        form << XML::Node.new('numProntuario', hvf.handbook_number)
        form << XML::Node.new('cnsCidadao', hvf.cns_number)
        form << XML::Node.new('dtNascimento', hvf.birth_date)
        form << XML::Node.new('sexo', hvf.gender.reference)
        form << XML::Node.new('statusVisitaCompartilhadaOutroProfissional', hvf.other_visit)

        hvf.home_visit_reasons.each do |hvr|
          form << XML::Node.new('motivosVisita', hvr.reason.reference)
        end
        form << XML::Node.new('desfecho', hvf.outcome.reference)
        form << XML::Node.new('microArea', hvf.micro_area)
        form << XML::Node.new('stForaArea', hvf.out_area)
        form << XML::Node.new('tipoDeImovel', hvf.home_type.reference)
        form << XML::Node.new('pesoAcompanhamentoNutricional', hvf.weight_monitoring)
        form << XML::Node.new('alturaAcompanhamentoNutricional', hvf.height_monitoring)
      end

      xml << sender = XML::Node.new('ns2:remetente')
      sender << XML::Node.new('contraChave', data.sender_counter_key)
      sender << XML::Node.new('uuidInstalacao', data.sender_installation_uuid)
      sender << XML::Node.new('cpfOuCnpj', data.sender_federal_registry)
      sender << XML::Node.new('nomeOuRazaoSocial', data.sender_legal_name)
      sender << XML::Node.new('fone', data.sender_phone)
      sender << XML::Node.new('email', data.sender_email)
      sender << XML::Node.new('versaoSistema', data.sender_software_version)
      sender << XML::Node.new('nomeBancoDados', data.sender_database_name)

      xml << origin = XML::Node.new('ns2:originadora')
      origin << XML::Node.new('contraChave', data.origin_counter_key)
      origin << XML::Node.new('uuidInstalacao', data.origin_installation_uuid)
      origin << XML::Node.new('cpfOuCnpj', data.origin_federal_registry)
      origin << XML::Node.new('nomeOuRazaoSocial', data.origin_legal_name)
      origin << XML::Node.new('fone', data.origin_phone)
      origin << XML::Node.new('email', data.origin_email)
      origin << XML::Node.new('versaoSistema', data.origin_software_version)
      origin << XML::Node.new('nomeBancoDados', data.origin_database_name)

      version = XML::Node.new('versao')
      XML::Attr.new(version, 'major', 3)
      XML::Attr.new(version, 'minor', 0)
      XML::Attr.new(version, 'revision', 3)

      xml << version
      xml
    end
  end
end
