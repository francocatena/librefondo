class AddEstimatedAmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :estimated_amount, :decimal, precision: 23, scale: 8
  end
end
