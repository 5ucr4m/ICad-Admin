class CreatePatientHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_histories do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.belongs_to(:patient_record, foreign_key: true, index: true)
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
