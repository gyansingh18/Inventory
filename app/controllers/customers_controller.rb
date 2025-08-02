class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to new_sales_order_path, notice: 'Customer added! Now create your order.'
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
