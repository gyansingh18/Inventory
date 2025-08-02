class SalesOrderController < ApplicationController

  def new
    @sales_orders = SalesOrder.new(order_date: Date.today)
    @sales_orders.sales_order_items.build
    @customers = Customer.all
    @products = Product.all
  end

  def create
    @salesorder = SalesOrder.new(sales_order_params)

    if @sales_orders.save
      redirect_to sales_order_path, notice: 'Order Created'
    else
      render :new
    end
  end

  def index
    @sales_orders = SalesOrder.includes(:customer, :sales_order_items)
  end

  private

  def sales_order_params
    params.require(:sales_order).permit(
      :customer_id,
      :order_date,
      sales_order_items_attributes: [:id, :product_id, :quantity, :unit_price, :_destroy]
    )
  end
end
