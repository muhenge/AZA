require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'Associations' do
    it { should belong_to(:customer) }
  end
  context "validations" do
    it "is not valid without a customer" do
      transaction = Transaction.create!(customer: nil, input_amount: 10, output_amount: 10)
      expect(transaction).to_not be_valid
    end
    it "is not valid without an amount" do
      transaction = Transaction.create!(customer: nil, input_amount: nil, output_amount: 10)
      expect(transaction).to_not be_valid
    end
  end

end
