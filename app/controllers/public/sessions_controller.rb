# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == ture)
  #カラムの中身に応じて処置の分岐。is_deletedが真＝サインアップにリダイレクト、偽の場合createの実行
  #退会フラグのデータ型booleanは0なら未退会、1なら退会済み、という風に0か1かだけでできる場合に使うデータ型
  end
end
end