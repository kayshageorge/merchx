class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :band_name
      t.string :email
      t.string :password_digest
      t.string :description

      t.timestamps
    end
  end
end
