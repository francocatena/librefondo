class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.date :load_date
      t.string :ric
      t.integer :fund_id, null: false, unique: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :stocks, :fund_id
  end
end
