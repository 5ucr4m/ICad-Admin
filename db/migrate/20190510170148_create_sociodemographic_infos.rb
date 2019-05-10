class CreateSociodemographicInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sociodemographic_infos do |t|
      t.boolean :has_disabilities
      t.text :citizen_disabilities
      t.belongs_to :education_level, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :exit_reason, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :sexual_orientation, foreign_key: {to_table: :generic_models}, index: true
      t.string :traditional_community
      t.belongs_to :parent_relation, foreign_key: {to_table: :generic_models}, index: true
      t.integer :child_responsible
      t.belongs_to :job_market_situation, foreign_key: {to_table: :generic_models}, index: true
      t.boolean :desire_sexual_orientation
      t.boolean :attend_folk_healer
      t.boolean :has_traditional_community
      t.boolean :community_group
      t.boolean :has_health_plan
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
