class Wishlist < ApplicationRecord
	belongs_to :product
	belongs_to :user
	validates_presence_of :product_id, :user_id
	def save_or_update
		list_item = Wishlist.find_by(user_id: self.user_id, product_id: self.product_id)
		if list_item.nil?
			self.save 
		else
			 #redirect_to wishlists_path, notice: "The product already exist in wishlist"
		end
	end
	def remove_from_cart
		remove_item = CartLineItem.find_by(user_id: self.user_id, product_id: self.product_id)
		if remove_item.nil?
		else
			remove_item.destroy
		end
		
	end
end
