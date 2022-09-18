class Api::TransactionsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_transaction, only: [:show]
  def index
    @transactions = Transaction.all.includes(:customer)
    render json: {message: "Found", transactions:@transactions }, status: 200
  end

  def show
    render json: {success: true, transaction:@transaction, customer: @transaction.customer }, status: 200
  end

  def create
    @transaction = current_customer.transactions.build(transaction_params)
    if @transaction.save
      render json: {success: true, Transaction:@transaction, response: "Transaction created successfully" }, status: 201
    else
      render json: {success: false, response: @transaction.errors.full_messages }, status: 401
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:input_amount,:customer_id)
  end

  def set_transaction
    @transaction = Transaction.includes(:customer).find(params[:id])
  end
end
