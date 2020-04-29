# frozen_string_literal: true
class CreateAppointmentBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :appointment_bookings do |t|
      t.belongs_to(:health_professional, foreign_key: true, index: true)
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.date(:appointment_date)
      t.string(:start_hour)
      t.string(:end_hour)
      t.text(:observation)
      t.string(:phone)
      t.belongs_to(:medical_procedure, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.integer(:status)
      t.integer(:priority)
      t.integer(:priority_order)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
    add_index(:appointment_bookings, :discarded_at)
    add_index(:appointment_bookings, :ip)
  end
end
