# frozen_string_literal: true

class CreateOutcomeTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Visita realizada'.mb_chars.upcase, reference: 1, generic_field: :outcome, generic_class: HomeVisitForm.model_name.name)
    GenericModel.create!(name: 'Visita recusada'.mb_chars.upcase, reference: 2, generic_field: :outcome, generic_class: HomeVisitForm.model_name.name)
    GenericModel.create!(name: 'Ausente'.mb_chars.upcase, reference: 3, generic_field: :outcome, generic_class: HomeVisitForm.model_name.name)
  end

  def down; end
end
