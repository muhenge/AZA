class Api::TransactionsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_transaction, only: [:show, :update]
  def index
    @transactions = Transaction.all.includes(:customer).most_recent # avoiding 1+N queries
    render json: {success:true, transactions:@transactions }, status: 200
  end

  def show
    render json: {success: true, transaction:@transaction, customer: @transaction.customer }, status: 200
  end

  def create
    @transaction = current_customer.transactions.build(transaction_params)
    @transaction.input_amount = Money.new(@transaction.input_amount, @transaction.in_currency).cents
    @in_currency = Money.new(@transaction.input_amount, @transaction.in_currency).currency
    @out_currency = Money.new(@transaction.output_amound, @transaction.out_currency).currency
    @transaction.output_amound = Money.new(@transaction.output_amound, @transaction.out_currency).cents
    @transaction.output_amound = Money.add_rate(@in_currency, @out_currency, 10.24515)

    if @transaction.save
      render json: {success: true, response: "Transaction created successfully", Transaction:@transaction }, status: 201
    else
      render json: {success: false, response: @transaction.errors.full_messages }, status: 401
    end
  end

  def update
    @transaction.update(transaction_params)
  end
  private
  def transaction_params
    params.require(:transaction).permit(:input_amount,:output_amound,:in_currency, :out_currency,:customer_id)
  end

  def set_transaction
    @transaction = Transaction.includes(:customer).find(params[:id])
  end
end
