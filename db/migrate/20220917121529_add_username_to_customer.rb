class AddUsernameToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :username, :string
  end
end
