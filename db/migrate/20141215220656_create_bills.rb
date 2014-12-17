class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.datetime :due_at
      t.integer :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
