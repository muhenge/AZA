class Transaction < ApplicationRecord
  belongs_to :customer
  validates :input_amount, presence: true
end

# Path: app/models/customer.rb
# Compare this snippet from app/models/customer.rb:
# class Customer < ApplicationRecord
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable,
#          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
#
#   validates :username, presence: true, uniqueness: true
# end
#
# Compare this snippet from spec/models/transaction_spec.rb:
# require 'rails_helper'
#
# RSpec.describe Transaction, type: :model do
#   context 'Associations' do
#     it { should belong_to(:customer) }
#   end
#   context "validations" do
#     it "is not valid without a customer" do
#       transaction = Transaction.create!(customer: nil, input_amount: 10, output_amount: 10)
#       expect(transaction).to_not be_valid
#     end
#     it "is not valid without an amount" do
#       transaction = Transaction.create!(customer: nil, input_amount: nil, output_amount: 10)
#       expect(transaction).to_not be_valid
#     end
#   end
#
# end
#
# Compare this snippet from app/models/jwt_denylist.rb:
# class JwtDenylist < ApplicationRecord
#   include Devise::JWT::RevocationStrategies::Denylist
#
#   self.table_name = 'jwt_denylist'
# end
#
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :username, presence: true, uniqueness: true
end
