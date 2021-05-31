# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id             :integer          not null, primary key
#  quantity       :integer          not null
#  product_name   :string           not null
#  price          :float            not null
#  subtotal       :float            not null
#  product_id     :integer          not null
#  order_id       :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class OrderItem < ApplicationRecord
  validates :quantity, presence: true
  validates :price, presence: true

  belongs_to :product
  belongs_to :order
end
