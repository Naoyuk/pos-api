# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  price          :float            not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :category
  has_many :order_items
end
