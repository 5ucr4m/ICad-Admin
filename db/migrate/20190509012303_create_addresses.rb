class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :patio
      t.string :number
      t.string :zip
      t.belongs_to :district, foreign_key: true, index: true
      t.string :complement
      t.string :reference
      t.belongs_to :registry, foreign_key: true, index: true
      t.string :longitude
      t.string :latitude
      t.text :geo_json
      t.boolean :sus_system
      t.string :slug

      t.timestamps
    end
  end
end
