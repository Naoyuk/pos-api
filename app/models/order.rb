# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  order_number   :string           not null
#  order_type     :integer          not null
#  order_date     :datetime         not null
#  customer_name  :string           not null
#  heads          :integer          not null
#  table          :string           not null
#  pickup_time    :datetime
#  notes          :text
#  total          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  validates :order_number, presence: true
  validates :order_type, presence: true
  validates :order_date, presence: true
  validates :customer_name, presence: true
  validates :heads, presence: true
  validates :table, presence: true

  enum order_type: {
    dine_in: 0,
    to_go: 1,
    delivery: 2,
  }

  has_many :order_items
end
