class CreateStreetSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :street_situations do |t|
      t.string :kinship_degree
      t.string :other_accompanied
      t.integer :meals_per_day
      t.text :meals_origin
      t.boolean :accompanied
      t.boolean :familiar_reference
      t.boolean :receive_benefits
      t.boolean :street_situation
      t.boolean :has_personal_hygiene
      t.text :personal_hygiene
      t.boolean :family_visit
      t.integer :street_situation_time
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
