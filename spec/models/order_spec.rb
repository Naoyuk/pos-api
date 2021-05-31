require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with order_number, order_type, order_date, customer_name, heads and table" do
    order = FactoryBot.build(:order)
    expect(order).to be_valid
  end

  it "is invalid without order_number" do
    order = FactoryBot.build(:order, order_number: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without order_type" do
    order = FactoryBot.build(:order, order_type: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without order_date" do
    order = FactoryBot.build(:order, order_date: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without customer_name" do
    order = FactoryBot.build(:order, customer_name: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without heads" do
    order = FactoryBot.build(:order, heads: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without table" do
    order = FactoryBot.build(:order, table: nil)
    expect(order).to_not be_valid
  end
end
