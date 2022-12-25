class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :instagram_basic

  def instagram_basic
    if user_signed_in?
        auth_data = request.env["omniauth.auth"]
        logger.debug("HERE")
        logger.debug(auth_data)
        account = Account.new(account_username: auth_data.info.username, account_id: auth_data.info.id, media_count: auth_data.info.media_count, account_type: "Instagram")
        current_user.accounts << account
        redirect_to profile_path
    else
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
            set_flash_message(:notice, :success, kind: "Instagram") if is_navigational_format?
        else
            session["devise.instagram_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
            redirect_to new_user_registration_url
        end
    end
    
  end

  def failure
    redirect_to root_path
  end
end