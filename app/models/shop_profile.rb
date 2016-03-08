class ShopProfile < ActiveRecord::Base
	has_one :address 
	has_and_belongs_to_many :users
end
