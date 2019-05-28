class CreateGenderTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Masculino'.mb_chars.upcase, reference: 0, generic_field: :gender, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Feminino'.mb_chars.upcase, reference: 1, generic_field: :gender, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Ignorado'.mb_chars.upcase, reference: 4, generic_field: :gender, generic_class: FamilyMember.model_name.name)

  end

  def down

  end
end
