class CreateResidenceTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Domicílio'.mb_chars.upcase, reference: 1, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Comércio'.mb_chars.upcase, reference: 2, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Terreno baldio'.mb_chars.upcase, reference: 3, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Ponto Estratégico (cemitério, borracharia, ferro-velho, depósito de sucata ou materiais de construção, garagem de ônibus ou veículo de grande porte)'.mb_chars.upcase, reference: 4, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Escola'.mb_chars.upcase, reference: 5, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Creche'.mb_chars.upcase, reference: 6, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Abrigo'.mb_chars.upcase, reference: 7, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Instituição de longa permanência para idosos'.mb_chars.upcase, reference: 8, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Unidade prisional'.mb_chars.upcase, reference: 9, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Unidade de medida sócio educativa'.mb_chars.upcase, reference: 10, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Delegacia'.mb_chars.upcase, reference: 11, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Estabelecimento religioso'.mb_chars.upcase, reference: 12, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 99, generic_field: :residence_type, generic_class: HomeRegistration.model_name.name)
  end

  def down

  end
end
