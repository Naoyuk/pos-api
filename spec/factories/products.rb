FactoryBot.define do
  factory :product do
    name { "test" }
    sequence(:product) { |n| n * 5 }
  end
end

