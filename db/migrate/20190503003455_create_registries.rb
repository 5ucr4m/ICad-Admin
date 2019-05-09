class CreateRegistries < ActiveRecord::Migration[6.0]
  def change
    create_table :registries do |t|
      t.belongs_to :person_type, foreign_key: {to_table: :generic_models}, index: true
      t.string :legal_full_name
      t.string :fancy_name
      t.string :federal_registry
      t.string :state_registry
      t.string :slug

      t.timestamps
    end
  end
end
