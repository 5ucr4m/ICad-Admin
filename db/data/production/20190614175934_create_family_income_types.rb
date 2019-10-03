# frozen_string_literal: true

class CreateFamilyIncomeTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: '1/4 de salário mínimo'.mb_chars.upcase, reference: 1, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Meio salário mínimo'.mb_chars.upcase, reference: 2, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Um salário mínimo'.mb_chars.upcase, reference: 3, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Dois salários mínimos'.mb_chars.upcase, reference: 4, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Três salários mínimos'.mb_chars.upcase, reference: 7, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Quatro salários mínimos'.mb_chars.upcase, reference: 5, generic_field: :family_income, generic_class: Family.model_name.name)
    GenericModel.create!(name: 'Acima de quatro salários mínimos'.mb_chars.upcase, reference: 6, generic_field: :family_income, generic_class: Family.model_name.name)
  end

  def down; end
end
