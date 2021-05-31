class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :type
      t.datetime :order_date
      t.string :customer_name
      t.integer :heads
      t.string :table
      t.datetime :pickup_time
      t.text :notes
      t.float :total

      t.timestamps
    end
  end
end
