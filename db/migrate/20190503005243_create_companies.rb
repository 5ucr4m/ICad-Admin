class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.belongs_to :registry, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
