class ChangeColumnNameGroup < ActiveRecord::Migration[6.0]
  def change
    rename_column :sms_schedules, :group, :role_groups
  end
end
