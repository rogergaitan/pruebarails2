class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_category, :price
end
