require 'csv'

class CreateCarriedProcedures < SeedMigration::Migration
  def up
    CSV.foreach('procedimentos.csv', headers: false) do |csv|
      csv = csv[0].strip.split(';')

      next if csv[4] == 'NO_PROCEDIMENTO'

      GenericModel.create!(name: csv[4].mb_chars.upcase, reference: csv[3], generic_field: :carried_procedure, generic_class: MedicalCare.model_name.name)
    end
  end

  def down
  end
end
