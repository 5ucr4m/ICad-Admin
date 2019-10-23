class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :model_reference
      t.string :action_reference
      t.belongs_to :app_module, foreign_key: {to_table: :generic_models}, index: true
      t.string :slug

      t.timestamps
    end
  end
end
