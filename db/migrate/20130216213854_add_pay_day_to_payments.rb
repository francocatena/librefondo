class AddPayDayToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :pay_day, :integer
  end
end
