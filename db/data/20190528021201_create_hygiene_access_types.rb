class CreateHygieneAccessTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Banho'.mb_chars.upcase, reference: 42, generic_field: :hygiene_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Acesso a sanitário'.mb_chars.upcase, reference: 43, generic_field: :hygiene_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Higiene bucal'.mb_chars.upcase, reference: 44, generic_field: :hygiene_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 45, generic_field: :hygiene_access, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
