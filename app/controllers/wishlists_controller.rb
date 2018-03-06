class WishlistsController < ApplicationController

	def index
		@wishlists = current_user.wishlists
	end
	def create
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id = current_user.id
		@wishlist.remove_from_cart 
		@wishlist.save_or_update
		respond_to do |format|
			format.js
			format.html{redirect_to wishlists_path, notice: "The product successfully moved to wishlist"}
		end
	end
	def destroy
		@wishlist = Wishlist.find(params[:id])
		@wishlist.destroy
		redirect_to wishlists_path, notice: "The product was successfully removed from wishlist"
	end

	private
	def wishlist_params
		params[:wishlist].permit(:product_id)
	end
end
