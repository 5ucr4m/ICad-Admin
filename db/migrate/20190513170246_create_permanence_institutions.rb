# frozen_string_literal: true

class CreatePermanenceInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :permanence_institutions do |t|
      t.string(:name)
      t.boolean(:other_linked_professionals)
      t.string(:responsible_name)
      t.string(:responsible_cns)
      t.string(:institutional_role)
      t.string(:responsible_phone)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.string(:slug)

      t.timestamps
    end
  end
end
