require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validations' do
    it 'is not valid without a username' do
      customer = Customer.create(username: nil, email: 'hello@g.com', password: '123456')
      expect(customer).to_not be_valid
    end
  end
  it 'username is unique' do
    Customer.create!(username: 'hello', email: 'test@g.com', password: '123456')
    customer = Customer.create(username: 'hello', email: 'test4@g.com', password: '123456')
    expect(customer).to_not be_valid
  end
end
