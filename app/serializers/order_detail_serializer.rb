class OrderDetailSerializer < OrderSerializer 
  has_many :products
  attribute :total_cost
end
