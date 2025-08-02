class SalesOrdersController < ApplicationController

  def new
    @sales_order = SalesOrder.new(order_date: Date.today)
    @sales_order.sales_order_items.build
    @customers = Customer.all
    @products = Product.all
  end

  def create
    @sales_order = SalesOrder.new(sales_order_params)

    if @sales_order.save
      redirect_to sales_orders_path, notice: 'Order Created'
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
