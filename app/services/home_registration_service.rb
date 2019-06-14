# frozen_string_literal: true

require 'xml'

module HomeRegistrationService
  include XML

  NAMESPACES = {
    'xmlns:ns2': 'http://esus.ufsc.br/dadoinstalacao',
    'xmlns:ns3': 'http://esus.ufsc.br/dadotransporte',
    'xmlns:ns4': 'http://esus.ufsc.br/cadastrodomiciliar'
  }.freeze

  class << self
    def export(data)
      xml = XML::Node.new('ns3:dadoTransporteTransportXml')
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid)
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference)
      xml << XML::Node.new('codIbge', data.ibge_code)
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes)
      xml << XML::Node.new('numLote', data.lot_number)

      xml << hr = XML::Node.new('ns4:cadastroDomiciliarTransport')

      home_registration = data.registrable

      home_registration&.home_registration_pets do |hrp|
        hr << XML::Node.new('animaisNoDomicilio', hrp.reference)
      end

      home_registration&.living_condition do |hc|
        hr << lc = XML::Node.new('condicaoMoradia', hrp.reference)
        lc << XML::Node.new('abastecimentoAgua', hc.water_supply.reference) if hc&.water_supply.present?
        if hc&.rural_production_area.present?
          lc << XML::Node.new('areaProducaoRural', hc.rural_production_area.reference)
        end
        lc << XML::Node.new('destinoLixo', hc.garbage_disposal.reference) if hc&.garbage_disposal.present?
        if hc&.bathroom_drainage.present?
          lc << XML::Node.new('formaEscoamentoBanheiro', hc.bathroom_drainage.reference)
        end
        lc << XML::Node.new('localizacao', hc.home_location.reference)
        if hc&.home_wall_material.present?
          lc << XML::Node.new('materialPredominanteParedesExtDomicilio', hc.home_wall_material.reference)
        end
        lc << XML::Node.new('nuComodos', hc.rooms) if hc&.rooms.present?
        lc << XML::Node.new('nuMoradores', hc.residents) if hc&.residents.present?
        lc << XML::Node.new('situacaoMoradiaPosseTerra', hc.home_situation.reference) if hc&.home_situation.present?
        lc << XML::Node.new('stDisponibilidadeEnergiaEletrica', hc.electric_power) if hc&.electric_power.present?
        lc << XML::Node.new('tipoAcessoDomicilio', hc.home_access.reference) if hc&.home_access.present?
        lc << XML::Node.new('tipoDomicilio', hc.home_type.reference) if hc&.home_type.present?
        lc << XML::Node.new('aguaConsumoDomicilio', hc.water_treatment.reference) if hc&.water_treatment.present?
      end

      home_registration&.address do |address|
        hr << addr = XML::Node.new('enderecoLocalPermanencia')
        addr << XML::Node.new('bairro', address.district)
        addr << XML::Node.new('cep', address.zip.delete('-'))
        addr << XML::Node.new('codigoIbgeMunicipio', address.city.code)
        addr << XML::Node.new('complemento', address.complement) if address.complement.present?
        addr << XML::Node.new('nomeLogradouro', address.patio)
        addr << XML::Node.new('numero', address.number)
        addr << XML::Node.new('numeroDneUf', address.city.state.reference)
        addr << XML::Node.new('telefoneContato', address.referential_phone) if address.referential_phone.present?
        addr << XML::Node.new('telelefoneResidencia', address.home_phone) if address.home_phone.present?
        addr << XML::Node.new('tipoLogradouroNumeroDne', address.address_type.reference)
        addr << XML::Node.new('stSemNumero', address.number.present?)
        addr << XML::Node.new('pontoReferencia', address.reference) if address.reference.present?
        addr << XML::Node.new('microarea', address.micro_area) if address.out_area.blank?
        addr << XML::Node.new('stForaArea', address.out_area) if address.out_area.present?
      end

      home_registration&.families do |family|
        hr << fam = XML::Node.new('familias')
        fam << XML::Node.new('dataNascimentoResponsavel', family.responsible_birth_date) if family.responsible_birth_date.present?
        fam << XML::Node.new('numeroCnsResponsavel', family.responsible_cns_number)
        fam << XML::Node.new('numeroMembrosFamilia', family.members_quantity) if family.members_quantity.present?
        fam << XML::Node.new('numeroProntuario', family.handbook_number) if family.handbook_number.present?
        fam << XML::Node.new('rendaFamiliar', family.family_income.reference) if family&.family_income.present?
        fam << XML::Node.new('resideDesde', family.reside_since) if family.reside_since.present?
        fam << XML::Node.new('stMudanca', family.moving) if family.moving
      end

      xml << XML::Node.new('fichaAtualizada', home_registration.form_updated)
      xml << XML::Node.new('quantosAnimaisNoDomicilio', home_registration.pet_quantity)
      xml << XML::Node.new('stAnimaisNoDomicilio', home_registration.pet_quantity.positive? ? true : false)
      xml << XML::Node.new('statusTermoRecusa', home_registration.refuse_registration)
      xml << XML::Node.new('tpCdsOrigem', home_registration.tp_cds_origin)
      xml << XML::Node.new('uuid', home_registration.uuid)
      xml << XML::Node.new('uuidFichaOriginadora', home_registration.uuid_form_origin)
      xml << XML::Node.new('tipoDeImovel', home_registration.home_type.reference)

      home_registration&.permanence_institution do |pi|
        hr << per = XML::Node.new('instituicaoPermanencia')
        per << XML::Node.new('nomeInstituicaoPermanencia', pi.name)
        per << XML::Node.new('stOutrosProfissionaisVinculados', pi.other_linked_professionals)
        per << XML::Node.new('nomeResponsavelTecnico', pi.responsible_name)
        per << XML::Node.new('cnsResponsavelTecnico', pi.responsible_cns)
        per << XML::Node.new('cargoInstituicao', pi.institutional_role)
        per << XML::Node.new('telefoneResponsavelTecnico', pi.responsible_phone)
      end
    end
  end
end
