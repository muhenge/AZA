class Customers::RegistrationsController < Devise::RegistrationsController

  def create
    @customer = Customer.new(sign_up_params)

    if @customer.save
      render json: {success: true, Customer:@customer, response: "Signed up successfully" }, status: 201
    else
      render json: {success: false, response: @customer.errors.full_messages }, status: 401
    end
  end
  def update
    if @customer.update(sign_up_params)
      render json: {success: true, Customer:@customer, response: "Updated successfully" }, status: 201
    else
      render json: {success: false, response: @customer.errors.full_messages }, status: 401
    end
  end
end
