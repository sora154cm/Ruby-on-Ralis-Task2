class ApplicationController < ActionController::Base
#非ログイン状態では、ログイン画面へリダイレクト設定
before_action :authenticate_user!, except: [:top, :about]
#指定したデータは保存できるよう、許可
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end
