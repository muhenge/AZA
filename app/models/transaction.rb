class Transaction < ApplicationRecord
  validates :input_amount, presence: true
  belongs_to :customer
  scope :most_recent, -> { order(created_at: :desc) }
end
