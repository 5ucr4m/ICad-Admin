class AddInitialDateHourToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :individual_registrations, :initial_date_hour, :datetime
    add_column :individual_registrations, :final_date_hour, :datetime
    add_column :vaccination_items, :initial_date_hour, :datetime
    add_column :vaccination_items, :final_date_hour, :datetime
  end
end
