require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    before do
      product_category = FactoryGirl.create :product_category
      product_category2 = FactoryGirl.create :product_category, name: "test category 2"
      FactoryGirl.create_list(:product, 5, product_category: product_category)
      FactoryGirl.create :product, product_category: product_category2 
      
      get :index, id: product_category
      
      @json = JSON.parse response.body    
    end
      
    it "returns response status 200" do
      expect(response).to be_success
    end
    
    it "returns list of products" do
      expect(@json['products'].length).to eq(5)
    end
  end
end
