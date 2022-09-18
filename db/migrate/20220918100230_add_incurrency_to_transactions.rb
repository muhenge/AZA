class AddIncurrencyToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :in_currency, :string
  end
end
