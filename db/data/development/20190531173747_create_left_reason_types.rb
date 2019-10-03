# frozen_string_literal: true

class CreateLeftReasonTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Óbito'.mb_chars.upcase, reference: 135, generic_field: :left_reason, generic_class: CancelRegistration.model_name.name)
    GenericModel.create!(name: 'Mudança de território'.mb_chars.upcase, reference: 136, generic_field: :left_reason, generic_class: CancelRegistration.model_name.name)
  end

  def down; end
end
