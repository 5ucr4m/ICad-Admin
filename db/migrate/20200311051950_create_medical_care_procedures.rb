class CreateMedicalCareProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_care_procedures do |t|
      t.belongs_to :medical_care, foreign_key: true, index: true
      t.belongs_to :procedure_performed, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug
      t.datetime :discarded_at
      t.string :ip

      t.timestamps
    end
  end
end
