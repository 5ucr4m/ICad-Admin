# frozen_string_literal: true
class CreatePatientBackgrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_backgrounds do |t|
      t.belongs_to(:family_member, foreign_key: true, index: true)
      t.integer(:pregnant_type)
      t.integer(:childbirth)
      t.integer(:gestational_weeks)
      t.integer(:gestational_days)
      t.integer(:one_minute)
      t.integer(:five_minute)
      t.integer(:ten_minute)
      t.string(:baby_weight)
      t.string(:baby_height)
      t.string(:baby_cephalic_perimeter)
      t.text(:surgeries)
      t.text(:hospitalizations)
      t.text(:observations)
      t.string(:previous_pregnancy)
      t.string(:abortion)
      t.string(:vaginal_childbirth)
      t.string(:home_childbirth)
      t.string(:cesarean)
      t.string(:born_live)
      t.string(:live)
      t.string(:born_dead)
      t.string(:rn_minus)
      t.string(:rm_plus)
      t.string(:dead_first_week)
      t.string(:dead_after_week)
      t.boolean(:last_year_pregnancy)
      t.belongs_to(:user, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
  end
end
