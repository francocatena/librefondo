class AddRicToTrustFund < ActiveRecord::Migration
  def change
    add_column :trust_funds, :ric, :string
  end
end
