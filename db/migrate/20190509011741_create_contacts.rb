class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :contact_type, foreign_key: {to_table: :generic_models}, index: true
      t.string :contact
      t.string :observation
      t.belongs_to :registry, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
