# frozen_string_literal: true

class ChangeSmsScheduleRoleGroups < ActiveRecord::Migration[6.0]
  def change
    change_column :sms_schedules, :role_groups, :string
  end
end
