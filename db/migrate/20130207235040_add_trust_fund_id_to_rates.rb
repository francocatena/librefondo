class AddTrustFundIdToRates < ActiveRecord::Migration
  def change
    add_column :rates, :trust_fund_id, :integer
    add_index :rates, :trust_fund_id
  end
end
