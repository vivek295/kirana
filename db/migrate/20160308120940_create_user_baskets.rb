class CreateUserBaskets < ActiveRecord::Migration
  def change
    create_table :user_baskets do |t|
    	t.float :quantity

      t.timestamps null: false
    end
  end
end
