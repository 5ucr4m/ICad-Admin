class CreateTurnTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Manhã'.mb_chars.upcase, reference: 1, generic_field: :turn, generic_class: HomeVisitForm.model_name.name)
    GenericModel.create!(name: 'Tarde'.mb_chars.upcase, reference: 2, generic_field: :turn, generic_class: HomeVisitForm.model_name.name)
    GenericModel.create!(name: 'Noite'.mb_chars.upcase, reference: 3, generic_field: :turn, generic_class: HomeVisitForm.model_name.name)
  end

  def down

  end
end
