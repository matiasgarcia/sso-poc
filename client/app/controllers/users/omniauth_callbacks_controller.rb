class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def provider_poc
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Provider Poc') if is_navigational_format?
    else
      session['devise.provider_poc_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end
