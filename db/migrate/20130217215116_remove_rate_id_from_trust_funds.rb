class RemoveRateIdFromTrustFunds < ActiveRecord::Migration
  def up
    remove_column :trust_funds, :rate_id
  end

  def down
    add_column :trust_funds, :rate_id, :integer
  end
end
