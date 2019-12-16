# frozen_string_literal: true

require 'xml'

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

      xml = XML::Node.new('ns3:dadoTransporteTransportXml') # valid
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid) # valid
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference) # valid
      xml << XML::Node.new('codIbge', data.family_member.city.ibge_code) # valid
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes) # valid
      xml << XML::Node.new('ineDadoSerializado', data.serialized_ine) # valid
      xml << XML::Node.new('numLote', data.lot_number) # valid

      xml << vd = XML::Node.new('ns4:fichaVisitaDomiciliarMasterTransport') # valid
      vd << XML::Node.new('uuidFicha', data.uuid) # valid
      vd << XML::Node.new('tpCdsOrigem', 3) # valid

      health_professional = home_visit_registration.family_member.family
                                                   .home_registration.health_professional
      health_establishment = health_professional.professional_team.health_establishment

      vd << ht = XML::Node.new('headerTransport') # valid
      ht << XML::Node.new('profissionalCNS', health_professional.cns_code) # valid
      ht << XML::Node.new('cboCodigo_2002', health_professional.cbo_code.reference) # valid
      ht << XML::Node.new('cnes', health_establishment.cnes_code) # valid
      ht << XML::Node.new('dataAtendimento', home_visit_registration.service_at.strftime('%Q')) # valid
      ht << XML::Node.new('codigoIbgeMunicipio', data.ibge_code) # valid

      home_visit_registration.home_visit_forms.each do |hvf|
        family_member = home_visit_registration.family_member
        vd << form = XML::Node.new('visitasDomiciliares') # valid
        form << XML::Node.new('turno', hvf.turn.reference) # valid
        form << XML::Node.new('numProntuario', hvf.handbook_number) # valid
        form << XML::Node.new('cnsCidadao', family_member.cns_number) # valid
        form << XML::Node.new('dtNascimento', family_member.birth_date) # valid
        form << XML::Node.new('sexo', family_member.gender.reference) # valid
        form << XML::Node.new('statusVisitaCompartilhadaOutroProfissional', hvf.other_visit) # valid

        hvf.home_visit_reasons.each do |hvr|
          form << XML::Node.new('motivosVisita', hvr.reason.reference) # valid
        end
        form << XML::Node.new('desfecho', hvf.outcome.reference) # valid
        form << XML::Node.new('microArea', hvf.micro_area) # valid
        form << XML::Node.new('stForaArea', hvf.out_area) # valid
        form << XML::Node.new('tipoDeImovel', hvf.home_type.reference) # valid
        form << XML::Node.new('pesoAcompanhamentoNutricional', hvf.weight_monitoring) # valid
        form << XML::Node.new('alturaAcompanhamentoNutricional', hvf.height_monitoring) # valid
      end

      xml << sender = XML::Node.new('ns2:remetente') # valid
      sender << XML::Node.new('contraChave', data.sender_counter_key) # valid
      sender << XML::Node.new('uuidInstalacao', data.sender_installation_uuid) # valid
      sender << XML::Node.new('cpfOuCnpj', data.sender_federal_registry) # valid
      sender << XML::Node.new('nomeOuRazaoSocial', data.sender_legal_name) # valid
      sender << XML::Node.new('fone', data.sender_phone) # valid
      sender << XML::Node.new('email', data.sender_email) # valid
      sender << XML::Node.new('versaoSistema', data.sender_software_version) # valid
      sender << XML::Node.new('nomeBancoDados', data.sender_database_name) # valid

      xml << origin = XML::Node.new('ns2:originadora') # valid
      origin << XML::Node.new('contraChave', data.origin_counter_key) # valid
      origin << XML::Node.new('uuidInstalacao', data.origin_installation_uuid) # valid
      origin << XML::Node.new('cpfOuCnpj', data.origin_federal_registry) # valid
      origin << XML::Node.new('nomeOuRazaoSocial', data.origin_legal_name) # valid
      origin << XML::Node.new('fone', data.origin_phone) # valid
      origin << XML::Node.new('email', data.origin_email) # valid
      origin << XML::Node.new('versaoSistema', data.origin_software_version) # valid
      origin << XML::Node.new('nomeBancoDados', data.origin_database_name) # valid

      version = XML::Node.new('versao') # valid
      XML::Attr.new(version, 'major', 3) # valid
      XML::Attr.new(version, 'minor', 2) # valid
      XML::Attr.new(version, 'revision', 1) # valid

      xml << version
      xml
    end
  end
end
