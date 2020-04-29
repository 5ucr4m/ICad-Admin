class CreatePatientObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_observations do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.text(:observation)
      t.boolean(:confidential)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
