# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Deviseのコントローラが動くときに、追加パラメータの許可を設定する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # 新規登録(sign_up)と更新(account_update)で、追加カラムを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:name, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])
  end
end
