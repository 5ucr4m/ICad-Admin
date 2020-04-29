class CreatePatientSoapObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_soap_objectives do |t|
      t.belongs_to(:patient_soap, foreign_key: true, index: true)
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
      t.boolean(:vaccination_updated)
      t.date(:dum)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
