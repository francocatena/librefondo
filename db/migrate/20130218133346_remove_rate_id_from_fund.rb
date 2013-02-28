class RemoveRateIdFromFund < ActiveRecord::Migration
  def up
    remove_column :funds, :rate_id
  end

  def down
    add_column :funds, :rate_id, :integer
  end
end
