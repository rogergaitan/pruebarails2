require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET #show" do
      
    before do
      customer = FactoryGirl.create :customer  
      product_category = FactoryGirl.create :product_category
      product = FactoryGirl.create :product, product_category: product_category
      product2 = FactoryGirl.create :product, name: "test product 2", price: 250, product_category: product_category

      order = FactoryGirl.create(:order, customer: customer)
      order.products << [product, product2]
      
      get :show, id: customer
    end
      
    it "returns expected response" do
      json = JSON.parse response.body  
      
      expected_content = {"order"=>{"id"=>1, "total_cost"=>"379.99", "products"=>[{"id"=>1, "name"=>"test product", "product_category"=>{"id"=>1, "name"=>"test category"}, "price"=>"129.99"}, {"id"=>2, "name"=>"test product 2", "product_category"=>{"id"=>1, "name"=>"test category"}, "price"=>"250.0"}]}}
        
       expect(json).to eq(expected_content)
    end
  end
  
  describe "POST #index" do
    it "creates new order" do
      customer = FactoryGirl.create :customer
      product_category = FactoryGirl.create :product_category
      product = FactoryGirl.create :product, product_category: product_category
      product2 = FactoryGirl.create :product, name: "test product 2", price: 200, product_category: product_category
      
      post :create, customer_id: customer.id, product_ids: [product.id, product2.id]
      
      expect(Order.count).to eq(1)
    end  
  end
  
end
