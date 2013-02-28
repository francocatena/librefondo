class AddAmortizationToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :amortization, :decimal, precision: 23, scale: 8
  end
end
