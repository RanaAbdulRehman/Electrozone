class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :order_id
      t.decimal :total, precision: 10, scale: 2
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
