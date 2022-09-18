class Api::TransactionsController < ApplicationController
  before_action :authenticate_customer!

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
    @transaction = Transaction.includes(:transaction).find(params[:id])
  end
end
