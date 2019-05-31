class CreateResponsibleChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :responsible_children do |t|
      t.belongs_to :responsible_child_type, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
