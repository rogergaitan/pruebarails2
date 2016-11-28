class ProductsController < ApplicationController
   def index
     render json: Product.where(product_category: params[:id])
   end 
end
