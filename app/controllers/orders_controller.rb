class OrdersController < ApplicationController
  def show
    render json: Order.find(params[:id]), serializer: OrderDetailSerializer
  end
end
