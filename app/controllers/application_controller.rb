class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, only: :new # 未ログインユーザーをログイン画面に遷移させる（only:出品アクションのみ）
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller? # もしdeviseに関する処理であれば

  protected

  def configure_permitted_parameters  # メソッド名は慣習
    # deviseのUserモデルに、keysに指定されたカラムを持つパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:last_name,:first_furigana,:last_furigana,:birthday])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む
    end
  end

end