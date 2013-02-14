class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name, null: false
      t.decimal :value, precision: 23, scale: 8
      t.string :kind
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :rates, :name
  end
end
