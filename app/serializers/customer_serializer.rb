class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone
end
