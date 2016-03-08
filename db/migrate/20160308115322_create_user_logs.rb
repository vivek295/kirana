class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
    	t.date :log
    	t.string :details
    	t.references :user
    	
      t.timestamps null: false
    end
  end
end
