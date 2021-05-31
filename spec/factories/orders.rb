FactoryBot.define do
  factory :order do
    sequence(:order_number) { |n| 1000 + n }
    order_type { :dine_in }
    order_date { Time.now }
    customer_name { "test" }
    heads { 1 }
    table { "A" }
    pickup_time { Time.now }
    notes { "test test test" }
    total { 20.5 }
  end
end
