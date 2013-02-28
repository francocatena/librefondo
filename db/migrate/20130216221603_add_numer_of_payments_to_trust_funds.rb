class AddNumerOfPaymentsToTrustFunds < ActiveRecord::Migration
  def change
    add_column :trust_funds, :number_of_payments, :integer
  end
end
