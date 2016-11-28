class Customer < ApplicationRecord
  has_many :orders
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :phone, numericality: { only_integer: true }
end
