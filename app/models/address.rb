class Address < ApplicationRecord
	has_many :orders
	belongs_to :user
	validates_presence_of :name, :details, :street, :landmark, :state, :city, :pincode, :user_id
end
