class CreateMedicalCareProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_care_procedures do |t|
      t.belongs_to :medical_care, null: false, foreign_key: true
      t.belongs_to :procedure_performed, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
      t.string :slug
      t.datetime :discarded_at
      t.string :ip

      t.timestamps
    end
  end
end
