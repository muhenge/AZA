class AddUsernameToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :username, :string
    add_index :customers, :username, unique: true
  end
end
