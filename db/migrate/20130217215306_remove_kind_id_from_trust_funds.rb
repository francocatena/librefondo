class RemoveKindIdFromTrustFunds < ActiveRecord::Migration
  def up
    remove_column :trust_funds, :kind_id
  end

  def down
    add_column :trust_funds, :kind_id, :integer
  end
end
