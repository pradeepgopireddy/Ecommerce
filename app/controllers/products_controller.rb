class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource
	#url - http://localhost:3000/products
	#uri - /products
	#path - products_path
	#http method - GET
	#roles& responsibility - to list all products
	def index
		@products = Product.all
	end
	#url - http://localhost:3000/products/new
	#uri - /products/new
	#path - new_product_path
	#http method - GET
	#roles& responsibility - is to setup a form for adding a new product
	def new
		@product = Product.new
		if params[:category_id]
			@product[:category_id] = params[:category_id]
		end
	end
	#url - http://localhost:3000/products
	#uri - /products
	#path - products_path
	#http method - POST
	#roles& responsibility - take the data coming in from the form, pass it to the constructor as an argument, validate the object, if the validations pass insert the record to the db and redirect the user to a new page , else display the errors on the form
	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product.id), notice: "The product was successfully created"
		else
			render action: 'new'
		end
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - product_path(id)
	#http method - GET
	#roles& responsibility - to find the product from the database and display it on  the show page, this page will be used to show all the data about a product and also associated information like all reviews, all q&a's, add product to cart
	def show
		@product = Product.find(params[:id])
		@review = Review.new
	end
	#url - http://localhost:3000/products/:id/edit
	#uri - /products/:id/edit
	#path - edit_product_path(id)
	#http method - GET
	#roles& responsibility - to find the record the user is trying to edit, and display it on a form 
	def edit
		@product = Product.find(params[:id])
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - product_path(id)
	#http method - PATCH
	#roles& responsibility - find the record, the user just updated in the browser, and update its information by taking the data coming in from the form, validations pass update the record to the db and redirect the user to a show page, else display the errors on the form
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to product_path(@product.id), notice: "The product was successfully updated"
		else
			render action: "edit"
		end
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - product_path(id)
	#http method - DELETE
	#roles& responsibility - find the record the user istrying to delete, and destroy the record and redirect the user to a index page
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: "The product was successfully destroyed"
	end

	private
	def product_params
		params[:product].permit(:name, :description, :price, :stock, :category_id, :cod_eligible, :image_url)
	end
end
