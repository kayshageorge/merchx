class RemovePriceFromSkus < ActiveRecord::Migration[5.1]
  def change
    remove_column :skus, :price, :string
  end
end
