class RemoveStockIdFromTrustFund < ActiveRecord::Migration
  def up
    remove_column :trust_funds, :stock_id
  end

  def down
    add_column :trust_funds, :stock_id, :integer
  end
end
