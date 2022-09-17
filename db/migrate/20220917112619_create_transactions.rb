class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :input_amount
      t.integer :output_amound

      t.timestamps
    end
  end
end
