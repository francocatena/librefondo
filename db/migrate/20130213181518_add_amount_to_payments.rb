class AddAmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :amount, :decimal, precision: 23, scale: 8
  end
end
