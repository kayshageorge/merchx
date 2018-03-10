class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :order, foreign_key: true
      t.references :sku, foreign_key: true
      t.string :qty
      t.string :total

      t.timestamps
    end
  end
end
