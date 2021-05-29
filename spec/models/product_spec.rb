require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with name and price" do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  it "is invalid without name" do
    product = FactoryBot.build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it "is invalid without price" do
    product = FactoryBot.build(:product, price: nil)
    expect(product).to_not be_valid
  end
end
