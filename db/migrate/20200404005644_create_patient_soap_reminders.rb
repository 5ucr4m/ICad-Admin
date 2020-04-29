class CreatePatientSoapReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_reminders do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
      t.boolean(:public_reminder)
      t.text(:description)
      t.boolean(:active)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
