class CreateBreastfeedingTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Exclusivo'.mb_chars.upcase, reference: 1, generic_field: :breastfeeding, generic_class: IndividualRegistration.model_name.name)
    GenericModel.create!(name: 'Predominante'.mb_chars.upcase, reference: 2, generic_field: :breastfeeding, generic_class: IndividualRegistration.model_name.name)
    GenericModel.create!(name: 'Complementado'.mb_chars.upcase, reference: 3, generic_field: :breastfeeding, generic_class: IndividualRegistration.model_name.name)
    GenericModel.create!(name: 'Inexistente'.mb_chars.upcase, reference: 4, generic_field: :breastfeeding, generic_class: IndividualRegistration.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 121, generic_field: :breastfeeding, generic_class: IndividualRegistration.model_name.name)

  end

  def down

  end
end
