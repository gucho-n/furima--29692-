class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :surname, :surname_kana, :firstname, :firstname_kana])
  end
end

# メモ用
# Q.devise内でパラメーターを使うには、許可がいる。
# A.その許可のやり方がconfigure_permitted_parameters、devise_parameter_sanitizerメソッドを使うことによって承認が降りる
# 早めに承認しておきたいので、beforeアクションがいる

# 大事！railsはいろいろと省略している。
# permit(:deviseの処理名, keys: [:許可するキー])
# このデバイスの処理名は（何に使うかということ）sign_up,sign_in,account_updateのこと
