class AddCountryToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :country, :string
  end
end
