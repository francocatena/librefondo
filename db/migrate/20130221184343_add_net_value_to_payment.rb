class AddNetValueToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :net_value, :decimal, precision: 23, scale: 8  
  end
end
