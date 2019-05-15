class CreateHomeVisitReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :home_visit_reasons do |t|
      t.belongs_to :home_visit_form, foreign_key: true, index: true
      t.belongs_to :reason, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
