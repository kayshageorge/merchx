class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.boolean :picked_up, default: false

      t.timestamps
    end
  end
end
