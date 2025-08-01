class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  def index
    @purchase_orders = PurchaseOrder.includes(:supplier).all
  end

  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.purchase_order_items.build
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to purchase_orders_path, notice: 'Purchase order created successfully'
    else
      render :new
    end
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(
      :supplier_id, :order_date,
      purchase_order_items_attributes: [:id, :product_id, :quantity, :unit_price, :_destroy]
    )
  end
end
