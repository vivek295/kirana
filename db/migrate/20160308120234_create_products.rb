class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :product_name
    	t.boolean :is_active
    	t.boolean :is_approved
    	t.string :unit_type
    	t.string :product_description
    	
      t.timestamps null: false
    end
  end
end
