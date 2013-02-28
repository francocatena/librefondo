class AddDailyAcrualToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :daily_acrual, :decimal, precision: 23, scale: 8
  end
end
