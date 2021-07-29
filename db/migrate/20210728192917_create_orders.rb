class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.string :address

      t.timestamps
    end
  end
end
