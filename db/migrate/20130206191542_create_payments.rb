class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.references :trust_fund
      t.string :kind
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :payments, :trust_fund_id
  end
end
