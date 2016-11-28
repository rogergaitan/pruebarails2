class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :products
  
  def total_cost
    products.sum(:price)
  end
end
