# frozen_string_literal: true

require 'xml'

module HomeRegistrationService
  include XML

  NAMESPACES = {
    'xmlns:ns2': 'http://esus.ufsc.br/dadoinstalacao',
    'xmlns:ns3': 'http://esus.ufsc.br/dadotransporte',
    'xmlns:ns4': 'http://esus.ufsc.br/cadastrodomiciliar',
  }.freeze

  class << self
    def export(data)
      xml = XML::Node.new('ns3:dadoTransporteTransportXml') # valid
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid) # valid
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference) # valid
      xml << XML::Node.new('codIbge', data.ibge_code) # valid
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes) # valid
      xml << XML::Node.new('numLote', data.lot_number) # valid

      xml << hr = XML::Node.new('ns4:cadastroDomiciliarTransport') # valid

      home_registration = data.registrable
      health_professional = home_registration.health_professional

      if data.home_type.reference.to_i == 1 || !data.refuse_registration
        home_registration.home_registration_pets do |hrp|
          hr << XML::Node.new('animaisNoDomicilio', hrp.pet_type.reference) # valid
        end
      end

      home_type = [2, 3, 4, 5, 6, 12, 99].include?(data.home_type.reference.to_i)

      if home_type || !data.refuse_registration
        home_registration.living_condition do |hc|
          hr << lc = XML::Node.new('condicaoMoradia') # valid
          if hc.water_supply.present?
            lc << XML::Node.new('abastecimentoAgua', hc.water_supply.reference) # valid
          end
          if hc.rural_production_area.present?
            lc << XML::Node.new('areaProducaoRural', hc.rural_production_area.reference) # valid
          end
          if hc.garbage_disposal.present?
            lc << XML::Node.new('destinoLixo', hc.garbage_disposal.reference) # valid
          end
          if hc.bathroom_drainage.present?
            lc << XML::Node.new('formaEscoamentoBanheiro', hc.bathroom_drainage.reference) # valid
          end
          lc << XML::Node.new('localizacao', hc.home_location.reference) # valid
          if hc.home_wall_material.present?
            lc << XML::Node.new('materialPredominanteParedesExtDomicilio', hc.home_wall_material.reference) # valid
          end
          lc << XML::Node.new('nuComodos', hc.rooms) if hc.rooms.present?
          if hc.residents.present?
            lc << XML::Node.new('nuMoradores', hc.residents) # valid
          end
          if hc.home_situation.present?
            lc << XML::Node.new('situacaoMoradiaPosseTerra', hc.home_situation.reference) # valid
          end
          if hc.electric_power.present?
            lc << XML::Node.new('stDisponibilidadeEnergiaEletrica', hc.electric_power) # valid
          end
          if hc.home_access.present?
            lc << XML::Node.new('tipoAcessoDomicilio', hc.home_access.reference) # valid
          end
          if hc.home_type.present?
            lc << XML::Node.new('tipoDomicilio', hc.home_type.reference) # valid
          end
          if hc.water_treatment.present?
            lc << XML::Node.new('aguaConsumoDomicilio', hc.water_treatment.reference) # valid
          end
        end
      end

      unless data.refuse_registration
        home_registration&.address do |address|
          hr << addr = XML::Node.new('enderecoLocalPermanencia') # valid
          addr << XML::Node.new('bairro', address.district) # valid
          addr << XML::Node.new('cep', address.zip.delete('-')) # valid
          addr << XML::Node.new('codigoIbgeMunicipio', address.city.code) # valid
          if address.complement.present? # valid
            addr << XML::Node.new('complemento', address.complement) # valid
          end
          addr << XML::Node.new('nomeLogradouro', address.patio) # valid
          addr << XML::Node.new('numero', address.number) # valid
          addr << XML::Node.new('numeroDneUf', address.city.state.reference) # valid
          if address.referential_phone.present?
            addr << XML::Node.new('telefoneContato', address.referential_phone) # valid
          end
          if address.home_phone.present?
            addr << XML::Node.new('telelefoneResidencia', address.home_phone) # valid
          end
          addr << XML::Node.new('tipoLogradouroNumeroDne', address.address_type.reference) # valid
          addr << XML::Node.new('stSemNumero', address.number.present?) # valid
          if address.reference.present?
            addr << XML::Node.new('pontoReferencia', address.reference) # valid
          end
          if address.out_area.blank?
            addr << XML::Node.new('microarea', address.micro_area) # valid
          end
          if address.out_area.present?
            addr << XML::Node.new('stForaArea', address.out_area) # valid
          end
        end
      end

      home_registration.families do |family|
        hr << fam = XML::Node.new('familias') # valid
        if family.responsible_birth_date.present?
          fam << XML::Node.new('dataNascimentoResponsavel', family.responsible_birth_date) # valid
        end
        fam << XML::Node.new('numeroCnsResponsavel', family.responsible_cns_number) # valid
        if family.members_quantity.present?
          fam << XML::Node.new('numeroMembrosFamilia', family.members_quantity) # valid
        end
        if family.handbook_number.present?
          fam << XML::Node.new('numeroProntuario', family.handbook_number) # valid
        end
        if family.family_income.present?
          fam << XML::Node.new('rendaFamiliar', family.family_income.reference) # valid
        end
        if family.reside_since.present?
          fam << XML::Node.new('resideDesde', family.reside_since) # valid
        end

        if data.home_type&.reference.to_i == 1
          fam << XML::Node.new('stMudanca', family.moving) # valid
        end
      end

      xml << XML::Node.new('fichaAtualizada', home_registration.form_updated) # valid
      xml << XML::Node.new('quantosAnimaisNoDomicilio', home_registration.pet_quantity) # valid
      xml << XML::Node.new('stAnimaisNoDomicilio', home_registration.pet_quantity.positive? ? true : false) # valid
      xml << XML::Node.new('statusTermoRecusa', home_registration.refuse_registration) # valid
      xml << XML::Node.new('tpCdsOrigem', 3) # valid
      xml << XML::Node.new('uuid', home_registration.uuid) # valid
      xml << XML::Node.new('uuidFichaOriginadora', home_registration.uuid_form_origin) # valid
      xml << XML::Node.new('tipoDeImovel', home_registration.home_type&.reference) # valid

      home_registration.permanence_institution do |pi|
        hr << per = XML::Node.new('instituicaoPermanencia') # valid
        per << XML::Node.new('nomeInstituicaoPermanencia', pi.name) if pi.name # valid
        if pi.other_linked_professionals
          per << XML::Node.new('stOutrosProfissionaisVinculados', pi.other_linked_professionals) # valid
        end
        per << XML::Node.new('nomeResponsavelTecnico', pi.responsible_name) # valid
        if pi.responsible_cns
          per << XML::Node.new('cnsResponsavelTecnico', pi.responsible_cns) # valid
        end
        if pi.institutional_role
          per << XML::Node.new('cargoInstituicao', pi.institutional_role) # valid
        end
        per << XML::Node.new('telefoneResponsavelTecnico', pi.responsible_phone) # valid
      end

      hr << ht = XML::Node.new('headerTransport') # valid
      ht << XML::Node.new('profissionalCNS', health_professional.cns_code) # valid
      ht << XML::Node.new('cboCodigo_2002', health_professional.cbo_code.reference) # valid
      ht << XML::Node.new('cnes', health_professional.professional_team.health_establishment.cnes_code) # valid
      ht << XML::Node.new('ine', health_professional.professional_team.code) # valid
      ht << XML::Node.new('dataAtendimento', data.created_at) # valid
      ht << XML::Node.new('codigoIbgeMunicipio', data.address.city.ibge_code) # valid

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
