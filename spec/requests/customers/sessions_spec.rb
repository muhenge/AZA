require 'rails_helper'

RSpec.describe "Customers::Sessions", type: :request do
  describe "POST /api/login" do
    scenario 'creates a new customer' do
      post '/api/signup', params:
        { customer: {
          username: 'hello',
          email: 'test@g.com',
          password: '123456',
          password_confirmation: '123456'
        }}
      post '/api/login', params:
        { customer: {
          email: 'test@g.com',
          password: '123456'
         }
        }
      expect(response.status).to eq(200)
      end
    end
end
