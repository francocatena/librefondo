class RemoveFundIdFromTrustFund < ActiveRecord::Migration
  def up
    remove_column :trust_funds, :fund_id
  end

  def down
    add_column :trust_funds, :fund_id, :integer
  end
end
