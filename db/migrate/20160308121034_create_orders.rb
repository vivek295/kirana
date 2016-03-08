class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.date :order_date
    	t.float :shipping_charge
    	t.float :order_value
    	t.string :order_state

      t.timestamps null: false
    end
  end
end
