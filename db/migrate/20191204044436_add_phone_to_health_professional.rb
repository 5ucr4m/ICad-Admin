class AddPhoneToHealthProfessional < ActiveRecord::Migration[6.0]
  def change
    add_column :health_professionals, :phone, :string
  end
end
