class CustomersController < ApplicationController
  def index
    render json: Customer.all
  end
  
  def show
    render json: Customer.find(params[:id]), serializer: CustomerDetailSerializer
  end
end
