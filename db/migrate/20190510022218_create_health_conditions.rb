class CreateHealthConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :health_conditions do |t|
      t.text :hospitalization_cause
      t.string :maternity_reference
      t.belongs_to :weight_situation, foreign_key: {to_table: :generic_models}, index: true
      t.boolean :alcohol_dependent
      t.boolean :other_drugs_dependent
      t.boolean :smoker
      t.boolean :pregnant
      t.boolean :bedridden
      t.boolean :domiciled
      t.boolean :diabetic
      t.boolean :leprosy
      t.boolean :tuberculosis
      t.boolean :avc_stroke
      t.boolean :had_heart_attack
      t.boolean :had_heart_disease
      t.boolean :recently_hospitalized
      t.text :recently_hospitalized_cause
      t.boolean :mental_issue
      t.boolean :integrative_practices
      t.boolean :medicinal_plants
      t.text :medicinal_plants_used
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
