class Public::CustomersController < ApplicationController
  def edit
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.customer_id = current_admin.id
    @customer.save
    redirect_to customers_path
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
  end
  
  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end
  
end
