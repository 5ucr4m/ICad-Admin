class CreateLocalServiceTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'UBS'.mb_chars.upcase, reference: 1, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Unidade móvel'.mb_chars.upcase, reference: 2, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Rua'.mb_chars.upcase, reference: 3, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Domicílio'.mb_chars.upcase, reference: 4, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Escola / Creche'.mb_chars.upcase, reference: 5, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 6, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Polo (academia da saúde)'.mb_chars.upcase, reference: 7, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Instituição / Abrigo'.mb_chars.upcase, reference: 8, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Unidade prisional ou congêneres'.mb_chars.upcase, reference: 9, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Unidade socioeducativa'.mb_chars.upcase, reference: 10, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Hospital'.mb_chars.upcase, reference: 11, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'Unidade de pronto atendimento'.mb_chars.upcase, reference: 12, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
    GenericModel.create!(name: 'CACON / UNACON'.mb_chars.upcase, reference: 13, generic_field: :local_service, generic_class: VaccinationItem.model_name.name)
  end

  def down

  end
end
