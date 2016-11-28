require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "GET #index" do
    it "returns response status 200" do
      get :index
      expect(response).to be_success
    end
    
    it "returns list of customers" do
      FactoryGirl.create_list :customer, 10
      get :index
      json = JSON.parse response.body
      expect(json['customers'].length).to eq(10)
    end
  end
  
  describe "GET #show" do
    before do
      @customer = FactoryGirl.create :customer
    end
      
    it "returns response status 200" do
      get :show, id: @customer  
      expect(response).to be_success
    end
    
    it "returns correct content" do
      product_category = FactoryGirl.create :product_category
      product = FactoryGirl.create :product, product_category: product_category 

      order = FactoryGirl.create(:order, customer: @customer)
      order.products << product
      
      @customer.orders << order
      
      get :show, id: @customer
      json = JSON.parse response.body
      expected_content = {"customer"=>{"id"=>1, "name"=>"test", "email"=>"test@12test.com", "address"=>"test address", "phone"=>"55566444", "orders"=>[{"id"=>1}]}}

      expect(json).to eq(expected_content)
    end
  end

end
