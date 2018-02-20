class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource #invokes ability class
	#url - http://localhost:3000/categories
	#uri - /categories
	#path - categories_path
	#http method - GET
	#roles& responsibility - to list all categories
	def index
		@categories = Category.all
	end
	#url - http://localhost:3000/categories/new
	#uri - /categories/new
	#path - new_category_path
	#http method - GET
	#roles& responsibility - is to setup a form for adding a new category
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		if @category.save
			redirect_to categories_path
		else
			render action: 'new'
		end
	end
	def show
		@category = Category.find(params[:id])
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category].permit(:name))
			redirect_to category_path(@category.id)
		else
			render action: 'edit'
		end
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	def check_name_present
    @category = Category.find_by(name: params[:name])
    render json: @category.nil? ? {'msg': true} : {'msg': false}
  end

end
