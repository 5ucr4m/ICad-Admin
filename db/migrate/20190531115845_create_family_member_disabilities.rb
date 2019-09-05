# frozen_string_literal: true

class CreateFamilyMemberDisabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :family_member_disabilities do |t|
      t.belongs_to :sociodemographic_info, foreign_key: true, index: true
      t.belongs_to :disability, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
