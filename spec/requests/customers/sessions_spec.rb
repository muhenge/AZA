require 'rails_helper'

RSpec.describe "Customers::Sessions", type: :request do
  describe "POST /api/login" do
    scenario 'user can login' do
      Customer.create(email: 'name@test.com', password: '123456')
      post '/api/login', params: { customer: { email: 'name@test.com', password: '123456' } }
      expect(response.status).to eq(200)
    end

  end

end
