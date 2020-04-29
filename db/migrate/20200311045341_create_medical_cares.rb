# frozen_string_literal: true
class CreateMedicalCares < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_cares do |t|
      t.belongs_to(:appointment_booking, foreign_key: true, index: true)
      t.belongs_to(:appointment_demand, foreign_key: true, index: true)
      t.belongs_to(:appointment_reason, foreign_key: { to_table: :generic_models }, index: true)
      t.text(:appointment_brief)
      t.string(:cephalic_perimeter)
      t.string(:weight)
      t.string(:height)
      t.string(:imc)
      t.string(:calf_perimeter)
      t.string(:blood_pressure)
      t.string(:blood_pressure_to)
      t.string(:respiratory_rate)
      t.string(:heart_rate)
      t.string(:temperature)
      t.string(:saturation)
      t.string(:capillary_blood)
      t.belongs_to(:collected_time, foreign_key: { to_table: :generic_models }, index: true)
      t.integer(:risk_vulnerability)
      t.boolean(:release_citizen)
      t.belongs_to(:medical_care, foreign_key: true, index: true)
      t.belongs_to(:other_appointment_booking, foreign_key: { to_table: :appointment_bookings }, index: true)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
