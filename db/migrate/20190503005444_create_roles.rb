class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.belongs_to :role, foreign_key: true, index: true
      t.belongs_to :app_module, foreign_key: {to_table: :generic_models}, index: true
      t.string :slug

      t.timestamps
    end
  end
end
