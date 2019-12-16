class AddUuidFormUpdateToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :home_registrations, :uuid_form_update, :string
    add_column :individual_registrations, :uuid_form_update, :string
    add_column :home_visit_registrations, :uuid_form_update, :string
  end
end
