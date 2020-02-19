# frozen_string_literal: true
class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string(:name)
      t.string(:substance)
      t.string(:laboratory)
      t.string(:laboratory_registry)
      t.string(:ggrem_code)
      t.string(:registry)
      t.string(:ean_one)
      t.string(:ean_two)
      t.string(:ean_three)
      t.string(:presentation)
      t.belongs_to(:therapeutic_class, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:product_type, foreign_key: { to_table: :generic_models }, index: true)
      t.belongs_to(:stripe, foreign_key: { to_table: :generic_models }, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)
      t.datetime(:discarded_at)
      t.string(:ip)

      t.timestamps
    end
    add_index(:medicines, :discarded_at)
    add_index(:medicines, :ip)
  end
end
