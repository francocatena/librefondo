class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name, null: false
      t.integer :rate_id, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :funds, :rate_id
  end
end
