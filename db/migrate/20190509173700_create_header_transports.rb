class CreateHeaderTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :header_transports do |t|
      t.belongs_to :health_professional, foreign_key: true, index: true
      t.datetime :service_at
      t.belongs_to :city, foreign_key: true, index: true
      t.belongs_to :main_lot_form, foreign_key: {to_table: :header_transports}
      t.belongs_to :shared_lot_form, foreign_key: {to_table: :header_transports}
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
