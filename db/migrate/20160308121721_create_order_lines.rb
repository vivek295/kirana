class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
    	t.string :shop_product_name
    	t.string :shop_product_price
    	t.float :quantity
    	t.float :line_value
    	t.boolean :is_fulfilled

      t.timestamps null: false
    end
  end
end
