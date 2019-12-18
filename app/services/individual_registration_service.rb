# frozen_string_literal: true

module IndividualRegistrationService
  class << self
    def export(data)
      individual_registration = data.registrable

      xml = XML::Node.new('ns3:dadoTransporteTransportXml') # valid
      xml << XML::Node.new('uuidDadoSerializado', data.serialized_uuid) # valid
      xml << XML::Node.new('tipoDadoSerializado', data.serialized_type.reference) # valid
      xml << XML::Node.new('codIbge', data.ibge_code) # valid
      xml << XML::Node.new('cnesDadoSerializado', data.serialized_cnes) # valid
      xml << XML::Node.new('numLote', data.lot_number) # valid

      xml << ci = XML::Node.new('ns4:cadastroIndividualTransport') # valid
      ci << cs = XML::Node.new('condicoesDeSaude') # valid

      health_condition = individual_registration.health_condition
      cs << XML::Node.new('descricaoCausaInternacaoEm12Meses', health_condition.hospitalization_cause) # valid
      cs << XML::Node.new('descricaoOutraCondicao1', health_condition.other_condition_one) # valid
      cs << XML::Node.new('descricaoOutraCondicao2', health_condition.other_condition_two) # valid
      cs << XML::Node.new('descricaoOutraCondicao3', health_condition.other_condition_three) # valid
      cs << XML::Node.new('descricaoPlantasMedicinaisUsadas', health_condition.medicinal_plants_used) # valid

      health_condition.health_condition_hearts.each do |disease|
        case disease.disease_type.reference.to_i
        when 24, 25, 26
          cs << XML::Node.new('doencaCardiaca', disease.disease_type.reference) # valid
        when 30, 31, 32, 33
          cs << XML::Node.new('doencaRespiratoria', disease.disease_type.reference) # valid
        when 27, 28, 29
          cs << XML::Node.new('doencaRins', disease.disease_type.reference) # valid
        end
      end

      cs << XML::Node.new('maternidadeDeReferencia', health_condition.maternity_reference) # valid
      cs << XML::Node.new('situacaoPeso', health_condition.weight_situation.reference) # valid
      cs << XML::Node.new('statusEhDependenteAlcool', health_condition.alcohol_dependent) # valid
      cs << XML::Node.new('statusEhDependenteOutrasDrogas', health_condition.other_drugs_dependent) # valid
      cs << XML::Node.new('statusEhFumante', health_condition.smoker) # valid
      cs << XML::Node.new('statusEhGestante', health_condition.pregnant) # valid
      cs << XML::Node.new('statusEstaAcamado', health_condition.bedridden) # valid
      cs << XML::Node.new('statusEstaDomiciliado', health_condition.domiciled) # valid
      cs << XML::Node.new('statusTemDiabetes', health_condition.diabetic) # valid
      cs << XML::Node.new('statusTemDoencaRespiratoria', health_condition.respiratory) # valid
      cs << XML::Node.new('statusTemHanseniase', health_condition.leprosy) # valid
      cs << XML::Node.new('statusTemHipertensaoArterial', health_condition.hypertension) # valid
      cs << XML::Node.new('statusTemTeveCancer', health_condition.cancer) # valid
      cs << XML::Node.new('statusTemTeveDoencasRins', health_condition.kidneys) # valid
      cs << XML::Node.new('statusTemTuberculose', health_condition.tuberculosis) # valid
      cs << XML::Node.new('statusTeveAvcDerrame', health_condition.avc_stroke) # valid
      cs << XML::Node.new('statusTeveDoencaCardiaca', health_condition.had_heart_disease) # valid
      cs << XML::Node.new('statusTeveInfarto', health_condition.had_heart_attack) # valid
      cs << XML::Node.new('statusTeveInternadoEm12Meses', health_condition.recently_hospitalized) # valid
      cs << XML::Node.new('statusUsaPlantaMedicinais', health_condition.medicinal_plants) # valid
      cs << XML::Node.new('statusDiagnosticoMental', health_condition.mental_issues) # valid
      cs << XML::Node.new('statusUsaOutrasPraticasIntegrativasOuComplementares', health_condition.integrative_practices) # valid

      in_street_situation = individual_registration.in_street_situation

      ci << sr = XML::Node.new('emSituacaoDeRua')
      sr << XML::Node.new('grauParentescoFamiliarFrequentado', in_street_situation.kinship_degree) # valid

      in_street_situation.in_street_hygiene_accesses.each do |hygiene|
        sr << XML::Node.new('higienePessoalSituacaoRua', hygiene.hygiene_access.reference) # valid
      end

      in_street_situation.in_street_situation_meals.each do |meal|
        sr << XML::Node.new('origemAlimentoSituacaoRua', meal.meal_origin_type.reference) # valid
      end

      sr << XML::Node.new('outraInstituicaoQueAcompanha', in_street_situation.other_accompanied) # valid
      sr << XML::Node.new('quantidadeAlimentacoesAoDiaSituacaoRua', in_street_situation.meals_per_day.reference) # valid
      sr << XML::Node.new('statusAcompanhadoPorOutraInstituicao', in_street_situation.has_other_accompanied) # valid
      sr << XML::Node.new('statusPossuiReferenciaFamiliar', in_street_situation.familiar_reference) # valid
      sr << XML::Node.new('statusRecebeBeneficio', in_street_situation.receive_benefits) # valid
      sr << XML::Node.new('statusSituacaoRua', in_street_situation.in_street_situation) # valid
      sr << XML::Node.new('statusTemAcessoHigienePessoalSituacaoRua', in_street_situation.has_personal_hygiene) # valid
      sr << XML::Node.new('statusVisitaFamiliarFrequentemente', in_street_situation.family_visit) # valid
      sr << XML::Node.new('tempoSituacaoRua', in_street_situation.street_situation_time.reference) # valid

      ci << XML::Node.new('fichaAtualizada', individual_registration.form_updated) # valid

      family_member = individual_registration.family_member

      ci << iu = XML::Node.new('identificacaoUsuarioCidadao') # valid
      iu << XML::Node.new('nomeSocial', family_member.social_name) # valid
      iu << XML::Node.new('codigoIbgeMunicipioNascimento', family_member.city.code) # valid
      iu << XML::Node.new('dataNascimentoCidadao', family_member.birth_date.to_datetime.strftime('%Q')) # valid
      iu << XML::Node.new('desconheceNomeMae', family_member.unknown_mother) # valid
      iu << XML::Node.new('emailCidadao', family_member.email) # valid
      iu << XML::Node.new('nacionalidadeCidadao', family_member.nationality.reference) # valid
      iu << XML::Node.new('nomeCidadao', family_member.name) # valid
      iu << XML::Node.new('nomeMaeCidadao', family_member.mother_name) # valid
      iu << XML::Node.new('cnsCidadao', family_member.cns_number) # valid
      iu << XML::Node.new('telefoneCelular', family_member.phone) # valid
      iu << XML::Node.new('paisNascimento', family_member.birth_country.reference) # valid
      iu << XML::Node.new('racaCorCidadao', family_member.race.reference) # valid
      iu << XML::Node.new('sexoCidadao', family_member.gender.reference) # valid
      iu << XML::Node.new('cnsResponsavelFamiliar', family_member.cns_responsible) # valid
      iu << XML::Node.new('statusEhResponsavel', family_member.responsible) # valid
      iu << XML::Node.new('etnia', family_member.ethnicity.reference) # valid
      iu << XML::Node.new('nomePaiCidadao', family_member.father_name) # valid
      iu << XML::Node.new('desconheceNomePai', family_member.unknown_father) # valid
      iu << XML::Node.new('microArea', family_member.micro_area) # valid
      iu << XML::Node.new('stForaArea', family_member.out_area) # valid
      iu << XML::Node.new('numeroNisPisPasep', family_member.pis_pasep_number) # valid
      iu << XML::Node.new('dtNaturalizacao', family_member.naturalized_at.to_datetime.strftime('%Q')) # valid
      iu << XML::Node.new('portariaNaturalizacao', family_member.naturalize_decree) # valid
      iu << XML::Node.new('dtEntradaBrasil', family_member.brazil_entry_date.to_datetime.strftime('%Q')) # valid

      sociodemographic_info = individual_registration.sociodemographic_info

      if sociodemographic_info
        ci << is = XML::Node.new('informacoesSocioDemograficas') # valid
        sociodemographic_info.family_member_disabilities.each do |fmd|
          is << XML::Node.new('deficienciasCidadao', fmd.disability.reference) # valid
        end
        is << XML::Node.new('grauInstrucaoCidadao', sociodemographic_info.education_level.reference) # valid
        is << XML::Node.new('ocupacaoCodigoCbo2002', sociodemographic_info.occupation.reference) # valid
        is << XML::Node.new('orientacaoSexualCidadao', sociodemographic_info.sexual_orientation.reference) # valid
        is << XML::Node.new('povoComunidadeTradicional', sociodemographic_info.traditional_community_name) # valid
        is << XML::Node.new('situacaoMercadoTrabalhoCidadao', sociodemographic_info.job_market_situation.reference) # valid
        is << XML::Node.new('statusDesejaInformarOrientacaoSexual', sociodemographic_info.desire_orientation) # valid
        is << XML::Node.new('statusFrequentaBenzedeira', sociodemographic_info.attend_folk_healer) # valid
        is << XML::Node.new('statusFrequentaEscola', sociodemographic_info.attend_school) # valid
        is << XML::Node.new('statusMembroPovoComunidadeTradicional', sociodemographic_info.traditional_communitity) # valid
        is << XML::Node.new('statusParticipaGrupoComunitario', sociodemographic_info.community_group) # valid
        is << XML::Node.new('statusPossuiPlanoSaudePrivado', sociodemographic_info.health_plan) # valid
        is << XML::Node.new('statusTemAlgumaDeficiencia', sociodemographic_info.has_any_disability) # valid
        is << XML::Node.new('identidadeGeneroCidadao', sociodemographic_info.gender_identity.reference) # valid
        is << XML::Node.new('statusDesejaInformarIdentidadeGenero', sociodemographic_info.desire_gender) # valid
      end

      cancel_registration = individual_registration.cancel_registration

      if cancel_registration
        ci << sc = XML::Node.new('saidaCidadaoCadastro')
        sc << XML::Node.new('motivoSaidaCidadao', cancel_registration.left_reason.reference) # valid
        if cancel_registration.left_reason.reference.to_i == 135
          decease_date = cancel_registration.decease_date
          birth_date = individual_registration.family_member.birth_date
          naturalized_at = individual_registration.family_member.naturalized_at
          created_at = individual_registration.created_at
          if (birth_date < decease_date) && (birth_date < naturalized_at) && (birth_date < created_at)
            sc << XML::Node.new('dataObito', decease_date.to_datetime.strftime('%Q')) # valid
            sc << XML::Node.new('numeroDO', cancel_registration.decease_number) # valid
          end
        end
      end

      ci << XML::Node.new('statusTermoRecusaCadastroIndividualAtencaoBasica', individual_registration.refuse_registration) # valid
      ci << XML::Node.new('tpCdsOrigem', 3) # valid
      ci << XML::Node.new('uuid', data.serialized_uuid) # valid
      ci << XML::Node.new('uuidFichaOriginadora', data.serialized_uuid) # valid

      hr << ht = XML::Node.new('headerTransport') # valid
      ht << XML::Node.new('profissionalCNS', data.health_professional.cns_code) # valid
      ht << XML::Node.new('cboCodigo_2002', data.health_professional.cbo_code.reference) # valid
      ht << XML::Node.new('cnes', data.serialized_cnes) # valid
      ht << XML::Node.new('dataAtendimento', data.created_at.to_datetime.strftime('%Q')) # valid
      ht << XML::Node.new('codigoIbgeMunicipio', data.ibge_code) # valid

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
