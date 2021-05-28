require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with name" do
    category = Category.new(name: "test")
    expect(category).to be_valid
  end

  it "is invalid without name" do
    category = Category.new(name: nil)
    expect(category).to_not be_valid
  end
end
