class AddStockIdToTrustFunds < ActiveRecord::Migration
  def change
    add_column :trust_funds, :stock_id, :integer
  end
end
