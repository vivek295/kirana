class CreateShopInventoryDetails < ActiveRecord::Migration
  def change
    create_table :shop_inventory_details do |t|
    	t.string :inventory_type
    	t.string :notes
    	t.float :quantity

      t.timestamps null: false
    end
  end
end
