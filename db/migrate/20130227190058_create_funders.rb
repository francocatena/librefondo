class CreateFunders < ActiveRecord::Migration
  def change
    create_table :funders do |t|
      t.references :trust_fund
      t.references :fund

      t.timestamps
    end
  end
end
