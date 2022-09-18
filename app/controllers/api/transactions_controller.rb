class Api::TransactionsController < ApplicationController
  def create
   
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
    @post = Post.includes(:transaction).find(params[:id])
  end
end
