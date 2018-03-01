class CartLineItemsController < ApplicationController
	def index
		#CartLineItem.where('user_id = ?', current_user.id)
		@cart_line_items = current_user.cart_line_items #to find only the cart line items for that currently logged in user
	end
	def create
		@cart_line_item = CartLineItem.new(cart_line_item_params)
		@cart_line_item.user_id = current_user.id
		@cart_line_item.save_or_update
		#@cart_line_item.remove_from_wishlist
		#redirect_to cart_line_items_path, notice: "Successfully added to the cart"
		# check  = current_user.cart_line_items.where('product_id = ?', @cart_line_item.product_id)
		# if check.empty?
		#  @cart_line_item.save
		# 	redirect_to cart_line_items_path, notice: "Successfully added the product to the product"
		# else
		# 	redirect_to cart_line_items_path, notice: "The product was already added to cart"
		# end

	end
	def destroy
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path, notice: "Item was Successfully removed"
	end
	# def update
	# 	@cart_line_item = CartLineItem.find(params[:id])
	# 	@cart_line_item.update_attributes(cart_line_item_params)
	# 	redirect_to cart_line_items_path
	# end
	private
	def cart_line_item_params
		params[:cart_line_item].permit(:product_id, :quantity)
	end
end
