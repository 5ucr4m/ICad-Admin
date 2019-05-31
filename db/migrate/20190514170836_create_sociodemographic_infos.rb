class CreateSociodemographicInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sociodemographic_infos do |t|
      t.belongs_to :education_level, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :occupation, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :sexual_orientation, foreign_key: { to_table: :generic_models }, index: true
      t.string :traditional_community_name
      t.belongs_to :parent_relation, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :job_market_situation, foreign_key: { to_table: :generic_models }, index: true
      t.boolean :desire_orientation
      t.boolean :attend_folk_healer
      t.boolean :traditional_community
      t.boolean :attend_school
      t.boolean :community_group
      t.boolean :health_plan
      t.boolean :has_any_disability
      t.boolean :desire_gender
      t.belongs_to :gender_identity, foreign_key: { to_table: :generic_models }, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
