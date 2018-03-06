module WishlistsHelper
	def wishlist_items
		return current_user.wishlists.size
	end
end
