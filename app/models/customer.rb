class Customer < ApplicationRecord
  has_many :orders
  
  validates :name, :email, :address, :phone, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: { only_integer: true }
end
