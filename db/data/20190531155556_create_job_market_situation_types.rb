class CreateJobMarketSituationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Empregador'.mb_chars.upcase, reference: 66, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Assalariado com carteira de trabalho'.mb_chars.upcase, reference: 67, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Assalariado sem carteira de trabalho'.mb_chars.upcase, reference: 68, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Autônomo com previdência social'.mb_chars.upcase, reference: 69, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Autônomo sem previdência social'.mb_chars.upcase, reference: 70, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Aposentado / Pensionista'.mb_chars.upcase, reference: 71, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Desempregado'.mb_chars.upcase, reference: 72, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Não trabalha'.mb_chars.upcase, reference: 73, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Servidor público / Militar'.mb_chars.upcase, reference: 147, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 74, generic_field: :job_market_situation, generic_class: SociodemographicInfo.model_name.name)
  end

  def down

  end
end
