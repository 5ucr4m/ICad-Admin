# frozen_string_literal: true

class AddNameToSmsSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :sms_schedules, :name, :string
  end
end
