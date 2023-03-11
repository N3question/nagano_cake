class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # 以下ネット情報から参照＆追加
  private
  
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_top_path
      else
        root_path
      end
  end

  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
        root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
  end
  # ここまで

  def configure_permitted_parameters # ログイン出来ない？エラー検出中。質問する。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana,
    :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :encrypted_password])
  end
end
