require 'rails_helper'

RSpec.describe "Customers::Registrations", type: :request do
  describe "POST /api/signup" do
    scenario 'creates a new customer' do
      post '/api/signup', params:
        { customer: {
          username: 'hello',
          email: 'test@g.com',
          password: '123456' }
          }
      expect(response.status).to eq(201)

    end
    scenario 'creates a new customer' do
      post '/api/signup', params:
        { customer: {
          username: nil,
          email: 'test@g.com',
          password: '123456' }
          }
      expect(response.status).to eq(401)
    end
  end

end
