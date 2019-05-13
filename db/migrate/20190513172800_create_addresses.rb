class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :address_type, foreign_key: {to_table: :generic_models}, index: true
      t.string :patio
      t.string :number
      t.string :zip
      t.string :complement
      t.string :district
      t.belongs_to :city, foreign_key: true, index: true
      t.string :referential_phone
      t.string :home_phone
      t.string :reference
      t.boolean :out_area
      t.string :micro_area
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
