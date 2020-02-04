# frozen_string_literal: true

require 'xml'

module VaccinationService
  include XML

  NAMESPACES = {
    'xmlns:ns2': 'http://esus.ufsc.br/dadoinstalacao',
    'xmlns:ns3': 'http://esus.ufsc.br/dadotransporte',
    'xmlns:ns4': 'http://esus.ufsc.br/fichavacinacaomaster',
  }.freeze

  class << self
    def export(data)
      vaccination = data.registrable

      xml = XML::Node.new('ns3:dadoTransporteTransportXml')
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid) # valid
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference) # valid
      xml << XML::Node.new('codIbge', data.family_member.city.ibge_code) # valid
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes) # valid
      xml << XML::Node.new('ineDadoSerializado', data.serialized_ine) # valid
      xml << XML::Node.new('numLote', data.lot_number)

      xml << vd = XML::Node.new('ns4:fichaVacinacaoMasterTransport') # valid
      vd << XML::Node.new('uuidFicha', data.uuid) # valid
      vd << XML::Node.new('tpCdsOrigem', 3) # valid

      health_professional = vaccination.family_member.family
        .home_registration.health_professional
      vd << ht = XML::Node.new('headerTransport') # valid
      ht << XML::Node.new('profissionalCNS', health_professional.cns_code) # valid
      ht << XML::Node.new('cboCodigo_2002', health_professional.cbo_code.reference) # valid
      ht << XML::Node.new('cnes', health_professional.professional_team.health_establishment.cnes_code) # valid
      ht << XML::Node.new('dataAtendimento', vaccination.created_at) # valid
      ht << XML::Node.new('codigoIbgeMunicipio', data.ibge_code) # valid

      vd << form = XML::Node.new('vacinacoes') # valid
      vaccination.family_member.vaccinations.each do |vc|
        form << XML::Node.new('turno', vc.turn.reference) # valid
        form << XML::Node.new('numProntuario', vc.family_member.handbook_number) # valid
        form << XML::Node.new('cnsCidadao', vc.family_member.cns_number) # valid
        form << XML::Node.new('dtNascimento', vc.family_member.birth_date.to_datetime.strftime('%Q')) # valid
        form << XML::Node.new('sexo', vc.family_member.gender.reference) # valid
        form << XML::Node.new('localAtendimento', vc.local_service.reference) # valid
        form << XML::Node.new('viajante', vc.traveller) # valid
        form << XML::Node.new('comunicanteHanseniase', vc.leprosy_communicant) # valid
        form << XML::Node.new('gestante', vc.pregnant) # valid
        form << XML::Node.new('puerpera', vc.puerperal) # valid
        vc.vaccines.each do |va|
          form << vcc = XML::Node.new('vacinas') # valid
          vcc << XML::Node.new('imunobiologico', va.immunobiological.reference) # valid
          vcc << XML::Node.new('estrategiaVacinacao', va.vaccination_strategy.reference) # valid
          vcc << XML::Node.new('dose', va.dose.reference) # valid
          vcc << XML::Node.new('lote', va.lot_number) # valid
          vcc << XML::Node.new('fabricante', va.manufacturer) # valid
        end
        form << XML::Node.new('dataHoraInicialAtendimento', vc.initial_date_hour.to_datetime.strftime('%Q')) # valid
        form << XML::Node.new('dataHoraFinalAtendimento', vc.initial_date_hour.to_datetime.strftime('%Q')) # valid
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
