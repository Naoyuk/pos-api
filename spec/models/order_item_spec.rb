require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it "is valid with quantity and price" do
    order_item = FactoryBot.build(:order_item, price: 10.5)
    expect(order_item).to be_valid
  end

  it "is invalid without quantity" do
    order_item = FactoryBot.build(:order_item, quantity: nil)
    expect(order_item).to_not be_valid
  end

  it "is invalid without price" do
    order_item = FactoryBot.build(:order_item, price: nil)
    expect(order_item).to_not be_valid
  end
end
