class CreatePatientSoaps < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soaps do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.text(:subject)
      t.text(:objective)
      t.text(:evaluation)
      t.text(:plan)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
