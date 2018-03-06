module CartLineItemsHelper
	def items_count
		if current_user.cart_line_items.empty?
			return 0
		else
			return current_user.cart_line_items.pluck(:quantity).inject(:+)
		end
	end

	def cart_total
		total = 0
		current_user.cart_line_items.each do |cart_line_item|
			total += cart_line_item.product.price * cart_line_item.quantity
		end
		return total
	end
end
