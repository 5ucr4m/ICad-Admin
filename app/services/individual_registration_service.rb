# frozen_string_literal: true

module IndividualRegistrationService
  class << self
    def export(data)
      individual_registration = data.registrable

      xml = XML::Node.new('ns3:dadoTransporteTransportXml')
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid)
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference)
      xml << XML::Node.new('codIbge', data.family_member.city.ibge_code)
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes)
      xml << XML::Node.new('numLote', data.lot_number)

      xml << ci = XML::Node.new('ns4:cadastroIndividualTransport')
      ci << cs = XML::Node.new('condicoesDeSaude')
      cs << XML::Node.new('descricaoCausaInternacaoEm12Meses', individual_registration.hospitalization_cause)
      cs << XML::Node.new('descricaoOutraCondicao1', individual_registration.other_condition_one)
      cs << XML::Node.new('descricaoOutraCondicao2', individual_registration.other_condition_two)
      cs << XML::Node.new('descricaoOutraCondicao3', individual_registration.other_condition_three)
      cs << XML::Node.new('descricaoPlantasMedicinaisUsadas', individual_registration.medicinal_plants_used)

      individual_registration.health_condition.health_condition_diseases.each do |disease|
        cs << XML::Node.new('doencaCardiaca', disease.disease_type.reference)
      end

      individual_registration.health_condition.health_condition_diseases.each do |disease|
        case disease.disease_type.reference.to_i
        when 24 || 25 || 26
          cs << XML::Node.new('doencaCardiaca', disease.disease_type.reference)
        when 30 || 31 || 32 || 33
          cs << XML::Node.new('doencaRespiratoria', disease.disease_type.reference)
        when 27 || 28 || 29
          cs << XML::Node.new('doencaRins', disease.disease_type.reference)
        end
      end

      health_condition = individual_registration.health_condition
      cs << XML::Node.new('maternidadeDeReferencia', health_condition.maternity_reference)
      cs << XML::Node.new('situacaoPeso', health_condition.weight_situation.reference)
      cs << XML::Node.new('statusEhDependenteAlcool', health_condition.alcohol_dependent)
      cs << XML::Node.new('statusEhDependenteOutrasDrogas', health_condition.other_drugs_dependent)
      cs << XML::Node.new('statusEhFumante', health_condition.smoker)
      cs << XML::Node.new('statusEhGestante', health_condition.pregnant)
      cs << XML::Node.new('statusEstaAcamado', health_condition.bedridden)
      cs << XML::Node.new('statusEstaDomiciliado', health_condition.domiciled)
      cs << XML::Node.new('statusTemDiabetes', health_condition.diabetic)
      cs << XML::Node.new('statusTemDoencaRespiratoria', health_condition.respiratory)
      cs << XML::Node.new('statusTemHanseniase', health_condition.leprosy)
      cs << XML::Node.new('statusTemHipertensaoArterial', health_condition.hypertension)
      cs << XML::Node.new('statusTemTeveCancer', health_condition.cancer)
      cs << XML::Node.new('statusTemTeveDoencasRins', health_condition.kidneys)
      cs << XML::Node.new('statusTemTuberculose', health_condition.tuberculosis)
      cs << XML::Node.new('statusTeveAvcDerrame', health_condition.avc_stroke)
      cs << XML::Node.new('statusTeveDoencaCardiaca', health_condition.had_heart_disease)
      cs << XML::Node.new('statusTeveInfarto', health_condition.had_heart_attack)
      cs << XML::Node.new('statusTeveInternadoEm12Meses', health_condition.recently_hospitalized)
      cs << XML::Node.new('statusUsaPlantaMedicinais', health_condition.medicinal_plants)
      cs << XML::Node.new('statusDiagnosticoMental', health_condition.mental_issues)
      cs << XML::Node.new('statusUsaOutrasPraticasIntegrativasOuComplementares', health_condition.integrative_practices)

      in_street_situation = individual_registration.in_street_situation

      ci << sr = XML::Node.new('emSituacaoDeRua')
      sr << XML::Node.new('grauParentescoFamiliarFrequentado', in_street_situation.kinship_degree)

      in_street_situation.in_street_hygiene_accesses.each do |hygiene|
        sr << XML::Node.new('higienePessoalSituacaoRua', hygiene.hygiene_access.reference)
      end

      in_street_situation.in_street_situation_meals.each do |meal|
        sr << XML::Node.new('origemAlimentoSituacaoRua', meal.meal_origin_type.reference)
      end

      sr << XML::Node.new('outraInstituicaoQueAcompanha', in_street_situation.other_accompanied)
      sr << XML::Node.new('quantidadeAlimentacoesAoDiaSituacaoRua', in_street_situation.meals_per_day.reference)
      sr << XML::Node.new('statusAcompanhadoPorOutraInstituicao', in_street_situation.has_other_accompanied)
      sr << XML::Node.new('statusPossuiReferenciaFamiliar', in_street_situation.familiar_reference)
      sr << XML::Node.new('statusRecebeBeneficio', in_street_situation.receive_benefits)
      sr << XML::Node.new('statusSituacaoRua', in_street_situation.in_street_situation)
      sr << XML::Node.new('statusTemAcessoHigienePessoalSituacaoRua', in_street_situation.has_personal_hygiene)
      sr << XML::Node.new('statusVisitaFamiliarFrequentemente', in_street_situation.family_visit)
      sr << XML::Node.new('tempoSituacaoRua', in_street_situation.street_situation_time.reference)

      xml << XML::Node.new('fichaAtualizada', individual_registration.form_updated)

      family_member = individual_registration.family_member

      ci << iu = XML::Node.new('identificacaoUsuarioCidadao')
      iu << XML::Node.new('nomeSocial', family_member.social_name)
      iu << XML::Node.new('codigoIbgeMunicipioNascimento', family_member.city.code)
      iu << XML::Node.new('dataNascimentoCidadao', family_member.birth_date.to_datetime.strftime('%Q'))
      iu << XML::Node.new('desconheceNomeMae', family_member.unknown_mother)
      iu << XML::Node.new('emailCidadao', family_member.email)
      iu << XML::Node.new('nacionalidadeCidadao', family_member.nationality.reference)
      iu << XML::Node.new('nomeCidadao', family_member.name)
      iu << XML::Node.new('nomeMaeCidadao', family_member.mother_name)
      iu << XML::Node.new('cnsCidadao', family_member.cns_number)
      iu << XML::Node.new('cnsResponsavelFamiliar', family_member.cns_responsible)
      iu << XML::Node.new('telefoneCelular', family_member.phone)
      iu << XML::Node.new('numeroNisPisPasep', family_member.pis_pasep_number)
      iu << XML::Node.new('paisNascimento', family_member.birth_country.reference)
      iu << XML::Node.new('racaCorCidadao', family_member.race.reference)
      iu << XML::Node.new('sexoCidadao', family_member.gender.reference)
      iu << XML::Node.new('statusEhResponsavel', family_member.responsible)
      iu << XML::Node.new('etnia', family_member.ethnicity.reference)
      iu << XML::Node.new('nomePaiCidadao', family_member.father_name)
      iu << XML::Node.new('desconheceNomePai', family_member.unknown_father)
      iu << XML::Node.new('dtNaturalizacao', family_member.naturalized_at.to_datetime.strftime('%Q'))
      iu << XML::Node.new('portariaNaturalizacao', family_member.naturalize_decree)
      iu << XML::Node.new('dtEntradaBrasil', family_member.brazil_entry_date.to_datetime.strftime('%Q'))
      iu << XML::Node.new('microArea', family_member.micro_area)
      iu << XML::Node.new('stForaArea', family_member.out_area)

      sociodemographic_info = individual_registration.sociodemographic_info

      ci << is = XML::Node.new('informacoesSocioDemograficas')
      sociodemographic_info.family_member_disabilities.each do |fmd|
        is << XML::Node.new('deficienciasCidadao', fmd.disability.reference)
      end
      is << XML::Node.new('grauInstrucaoCidadao', sociodemographic_info.education_level.reference)
      is << XML::Node.new('ocupacaoCodigoCbo2002', sociodemographic_info.occupation.reference)
      is << XML::Node.new('orientacaoSexualCidadao', sociodemographic_info.sexual_orientation.reference)
      is << XML::Node.new('povoComunidadeTradicional', sociodemographic_info.traditional_community_name)
      is << XML::Node.new('situacaoMercadoTrabalhoCidadao', sociodemographic_info.job_market_situation.reference)
      is << XML::Node.new('statusDesejaInformarOrientacaoSexual', sociodemographic_info.desire_orientation)
      is << XML::Node.new('statusFrequentaBenzedeira', sociodemographic_info.attend_folk_healer)
      is << XML::Node.new('statusFrequentaEscola', sociodemographic_info.attend_school)
      is << XML::Node.new('statusMembroPovoComunidadeTradicional', sociodemographic_info.traditional_communitity)
      is << XML::Node.new('statusParticipaGrupoComunitario', sociodemographic_info.community_group)
      is << XML::Node.new('statusPossuiPlanoSaudePrivado', sociodemographic_info.health_plan)
      is << XML::Node.new('statusTemAlgumaDeficiencia', sociodemographic_info.has_any_disability)
      is << XML::Node.new('identidadeGeneroCidadao', sociodemographic_info.gender_identity.reference)
      is << XML::Node.new('statusDesejaInformarIdentidadeGenero', sociodemographic_info.desire_gender)
    end
  end
end
