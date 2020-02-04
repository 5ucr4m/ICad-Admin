# frozen_string_literal: true

class CreateSmsMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :sms_messages do |t|
      t.datetime(:date_sent)
      t.string(:number)
      t.integer(:status)
      t.belongs_to(:sms_schedule, foreign_key: true, index: true)
      t.string(:slug)
      t.belongs_to(:company, foreign_key: true, index: true)

      t.timestamps
    end
  end
end
