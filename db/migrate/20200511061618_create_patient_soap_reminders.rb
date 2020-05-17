class CreatePatientSoapReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_reminders do |t|
      t.belongs_to :patient_soap, null: false, foreign_key: true
      t.text :description
      t.boolean :private_reminder
      t.boolean :active
      t.belongs_to :user, null: false, foreign_key: true
      t.string :slug
      t.belongs_to :company, null: false, foreign_key: true
      t.datetime :discarded_at
      t.string :ip

      t.timestamps
    end
  end
end
