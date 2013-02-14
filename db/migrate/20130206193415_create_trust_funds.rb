class CreateTrustFunds < ActiveRecord::Migration
  def change
    create_table :trust_funds do |t|
      t.integer :fund_id, null: false
      t.string :name, null: false
      t.integer :base
      t.decimal :coupon_tv, precision: 23, scale: 8
      t.decimal :coupon_tv_cap, precision: 23, scale: 8
      t.decimal :coupon_tv_floor, precision: 23, scale: 8
      t.decimal :nominal_value, precision: 23, scale: 8
      t.integer :rate_id, null: false
      t.decimal :differential_margin, precision: 23, scale: 8
      t.decimal :broadcast_cost, precision: 23, scale: 8
      t.decimal :price, precision: 23, scale: 8
      t.string :rating
      t.date :buy_date
      t.date :settlement_date
      t.date :broadcast_date
      t.date :expiration_date
      t.decimal :tenancy, precision: 23, scale: 8
      t.decimal :purchase_price, precision: 23, scale: 8
      t.decimal :tcpe, precision: 23, scale: 8
      t.decimal :minimal_cost, precision: 23, scale: 8
      t.decimal :maximal_cost, precision: 23, scale: 8
      t.integer :kind_id, null: false
      t.date :cut_date
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :trust_funds, :fund_id
    add_index :trust_funds, :rate_id
    add_index :trust_funds, :kind_id
    add_index :trust_funds, :name
  end
end
