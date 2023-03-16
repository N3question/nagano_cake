# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :customer_state, only: [:create]
  before_action :reject_deleted_user, only: [:create]
  
  def reject_deleted_user
    @customer = Customer.find_by(email: params[:email])
    if @customer
      if @customer.valid_password?(params[:user][:password]) && @customer.is_deleted == true
        flash[:notice] = "退会済みの為、再登録が必要です。"
        redirect_to new_customer_registration_path
      end
    end
  end
  
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
  
  
  # 退会しているかを判断するメソッド
  # def customer_state
  
  #   ## 【処理内容1】 入力されたemailからアカウントを1件取得
  #   @customer = Customer.find_by(email: params[:customer][:email])
  
  #   ## アカウントを取得できなかった場合、このメソッドを終了する
  #   return if !@customer
  
  #   ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #   ## 【処理内容3】 &&以降
  #   if @customer.valid_password?(params[:customer][:password]) && !@customer.is_valid
  #       redirect_to new_user_session_path
  #   end
  
  # end
  
end
