class AddIdentifierToTrustFund < ActiveRecord::Migration
  def change
    add_column :trust_funds, :identifier, :string
  end
end
