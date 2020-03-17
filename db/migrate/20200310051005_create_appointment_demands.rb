class CreateAppointmentDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :appointment_demands do |t|
      t.belongs_to :family_member, foreign_key: true, index: true
      t.belongs_to :health_professional, foreign_key: true, index: true
      t.boolean :manage_medicine
      t.boolean :curative
      t.boolean :appointment_demand
      t.boolean :initial_listening
      t.boolean :examination
      t.boolean :nebulization
      t.boolean :dentistry
      t.boolean :procedures
      t.boolean :vaccine
      t.belongs_to :company, foreign_key: true, index: true
      t.datetime :discarded_at
      t.string :ip

      t.timestamps
    end
  end
end
