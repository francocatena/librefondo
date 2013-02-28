class AddPeriodRateToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :period_rate, :decimal, precision: 23, scale: 8
  end
end
