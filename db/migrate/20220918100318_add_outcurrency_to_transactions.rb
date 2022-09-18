class AddOutcurrencyToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :out_currency, :string
  end
end
