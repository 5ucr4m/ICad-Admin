class CreateGenderIdentities < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Homem transsexual'.mb_chars.upcase, reference: 149, generic_field: :gender_identity, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Mulher transsexual'.mb_chars.upcase, reference: 150, generic_field: :gender_identity, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Travesti'.mb_chars.upcase, reference: 156, generic_field: :gender_identity, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 151, generic_field: :gender_identity, generic_class: SociodemographicInfo.model_name.name)
  end

  def down

  end
end
