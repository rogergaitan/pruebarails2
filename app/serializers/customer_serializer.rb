class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone
  has_many :orders
end
