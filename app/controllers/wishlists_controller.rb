class WishlistsController < ApplicationController

	def index
		@wishlists = current_user.wishlists
	end
	def create
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id = current_user.id
		@wishlist.save_or_update
		@wishlist.remove_from_cart 
		redirect_to wishlists_path, notice: "The product successfully moved to wishlist"
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
