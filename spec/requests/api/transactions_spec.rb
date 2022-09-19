require 'rails_helper'

RSpec.describe "Api::Transactions", type: :request do
  describe "POST /api/transactions" do
    scenario 'creates a new transaction' do
      post '/api/transactions', params:
        { transaction: {
          input_amount: 1000,
          output_amound: 1000,
          in_currency: 'USD',
          out_currency: 'EU4',
          customer_id: 1
        }
          }
      expect(response.status) == 201
    end
  end
end
