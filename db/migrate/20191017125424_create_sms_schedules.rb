# frozen_string_literal: true

class CreateSmsSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :sms_schedules do |t|
      t.string(:name)
      t.datetime(:scheduled_date)
      t.text(:message)
      t.string(:role_groups)
      t.integer(:status)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)

      t.timestamps
    end
  end
end
