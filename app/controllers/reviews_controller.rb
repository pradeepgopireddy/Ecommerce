class ReviewsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@reviews = current_user.reviews
	end
	def create 
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			redirect_to product_path(@review.product_id), notice: "Thanks you for adding a review."
		end
	end
	def edit
		@review = Review.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(review_params)
			redirect_to review_path(@review.id)
		else
			render action: "edit"
		end
	end
	def show
		@review = Review.find(params[:id])
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to product_path(@review.product_id), notice: "You have sucessfully deleted the review."
	end

	private
	def review_params
		params[:review].permit(:body, :rating, :product_id, :user_id)
	end
end
