class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name, null: false
      t.integer :daily_acrual
      t.date :cut_date
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :kinds, :name
  end
end
