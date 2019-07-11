class CreateVaccinationCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccination_campaigns do |t|
      t.string :title
      t.text :description
      t.belongs_to :vaccine, foreign_key: true, index: true
      t.boolean :child
      t.boolean :woman
      t.date :period_start
      t.date :period_end
      t.integer :age_initial
      t.integer :age_end
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
