class OrdersController < ApplicationController
  def show
    render json: Order.find(params[:id]), serializer: OrderDetailSerializer
  end
  
  def create
    customer = Customer.find params[:customer_id]
    products = Product.find params[:product_ids]
    order = Order.create(customer: customer)
    order.products << products
    if order.save
      render 201
    else
      render 400
    end  
  end
end
