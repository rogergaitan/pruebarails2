FactoryGirl.define do
  factory :customer do
   name "test"
   sequence(:email) { |n| "test@#{n}test.com"}
   address "test address"
   phone 55566444
  end
end
