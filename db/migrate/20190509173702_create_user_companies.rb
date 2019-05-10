class CreateUserCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_companies do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.boolean :current
      t.string :slug

      t.timestamps
    end
  end
end
