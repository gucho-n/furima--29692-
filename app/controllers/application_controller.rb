class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # configure_permitted_parameters, if: :devise_controller?は慣習だと覚えておこう。

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :surname, :surname_kana, :firstname, :firstname_kana])
    # devise内でパラメーターを使うには、許可がいる。devise_parameter_sanitizerメソッドを使うことによって承認が降りる
    # 早めに承認しておきたいので、beforeアクションがいる
    # permit(:deviseの処理名, keys: [:許可するキー])
    # このデバイスの処理名はsign_up,sign_in,account_update
  end

  # コントローラーどーするかわからん！クリエイト？
end
