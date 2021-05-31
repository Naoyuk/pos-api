class RenameTypeColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :type, :order_type
  end
end
