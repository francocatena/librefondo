class AddResidualValueToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :residual_value, :decimal, precision: 23, scale: 8
  end
end
