class CreateCitizenDisabilityTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Auditiva'.mb_chars.upcase, reference: 12, generic_field: :citizen_disability, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Visual'.mb_chars.upcase, reference: 13, generic_field: :citizen_disability, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Intelectual / Cognitiva'.mb_chars.upcase, reference: 14, generic_field: :citizen_disability, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Física'.mb_chars.upcase, reference: 15, generic_field: :citizen_disability, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outra'.mb_chars.upcase, reference: 16, generic_field: :citizen_disability, generic_class: SociodemographicInfo.model_name.name)
  end

  def down

  end
end
