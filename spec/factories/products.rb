FactoryBot.define do
  factory :product do
    name { "test" }
    sequence(:price) { |n| n * 5 }
    category_id { 1 }
  end
end

