class CustomerDetailSerializer < CustomerSerializer
  has_many :orders
end 
