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
  #会員情報を確認するためのコマンド
  def end_user_state
    ## 【処理内容1】入力されたemailからアカウントを1件取得
     @user = User.find_by(email: params[:user][:email])
    ## 【アカウントを取得できなかった場合、このメソッドを終了
    return if !@user
    ## 【処理内容2】取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      flash[:notice] = "退会済みです。お手数ですが、再度ご登録をしてご利用してください。"
      redirect_to new_user_registration_path
    end
  end

end
