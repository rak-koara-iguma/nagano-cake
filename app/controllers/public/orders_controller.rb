class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end
  
  def check
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.name = current_customer.last_name+current_customer.first_name
    @order.address = current_customer.address
    @order.postal_code = current_customer.postal_code
    @cart_items = current_customer.cart_items
    @sum = 0
    @postage = 800
    render :check
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price*1.1).floor
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :method_of_payment, :postage, :name, :address, :postal_code, :billing_amount)
  end
end