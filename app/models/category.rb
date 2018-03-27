class Category < ApplicationRecord
	acts_as_tree 
	has_many :products
	validates_presence_of :name
	validates_uniqueness_of :name
end
