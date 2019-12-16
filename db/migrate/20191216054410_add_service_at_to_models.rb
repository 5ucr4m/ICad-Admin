class AddServiceAtToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :home_registrations, :service_at, :datetime
    add_column :home_visit_registrations, :service_at, :datetime
    add_column :home_visit_forms, :service_at, :datetime
    add_column :individual_registrations, :service_at, :datetime
    add_column :vaccinations, :service_at, :datetime
  end
end
