class CreateFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :family_members do |t|
      t.belongs_to :family, foreign_key: true, index: true
      t.string :social_name
      t.belongs_to :city, foreign_key: true, index: true
      t.date :birth_date
      t.boolean :unknown_mother
      t.string :mother_name
      t.string :email
      t.belongs_to :nationality, foreign_key: {to_table: :generic_models}, index: true
      t.string :name
      t.string :cns_number
      t.string :cns_responsible
      t.string :phone
      t.string :pis_pasep_number
      t.belongs_to :birth_country, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :race, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :gender, foreign_key: {to_table: :generic_models}, index: true
      t.boolean :responsible
      t.belongs_to :ethnicity, foreign_key: {to_table: :generic_models}, index: true
      t.boolean :unknown_father
      t.string :father_name
      t.date :naturalized_at
      t.string :naturalize_decree
      t.date :brazil_entry_date
      t.string :micro_area
      t.boolean :out_area
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
