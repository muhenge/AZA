require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "validations" do
    it "is not valid without a customer" do
      transaction = Transaction.create(input_amount: 10)
      expect(transaction).to_not be_valid
    end
    it "is not valid without an amount" do
      transaction = Transaction.create(input_amount: nil)
      expect(transaction).to_not be_valid
    end
  end
end
