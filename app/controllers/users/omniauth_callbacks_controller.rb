class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    @user = User.find_for_google(request.env['omniauth.auth'])

    # 返ってくるデータがDBに保存されているか確認し、保存に失敗したらサインアップ画面へリダイレクトする
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end