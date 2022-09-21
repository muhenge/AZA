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
      expect(response.status) == 201
      end
      scenario 'logs in a customer' do
        post '/api/login', params:
          { customer: {
            email: 'test@g.com',
            password: '123456'
          }}
          expect(response.status) == 200
        end
    end
end
