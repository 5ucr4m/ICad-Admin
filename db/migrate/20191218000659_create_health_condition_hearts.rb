class CreateHealthConditionHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :health_condition_hearts do |t|
      t.belongs_to :health_condition, foreign_key: true, index: true
      t.belongs_to :disease_type, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.datetime :discarded_at
      t.string :ip
      t.string :slug

      t.timestamps
    end

    add_index :health_condition_hearts, :discarded_at
  end
end
