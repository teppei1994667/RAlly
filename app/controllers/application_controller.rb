class ApplicationController < ActionController::Base
  #もしdeviseのコントローラーの事なら全てのアクションの前にメソッドを読み込む
  before_action :configure_signup_parameters, if: :devise_controller? #新規登録の場合

  private
  #新規登録機能でshop_nameのパラメーターを受け取れるように設定
  def configure_signup_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:shop_name])
  end

end
