class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    login_with(Oauth::Facebook)
  end

  def google_oauth2
    login_with(Oauth::Google)
  end

  def github
    login_with(Oauth::Github)
  end

  def login_with(klass)
    env          = request.env["omniauth.auth"]
    origin       = request.env["omniauth.origin"]
    user         = klass.find_or_build_user(env)
    redirect_url = redirect_url_for(user, origin)
    message      = login_message(user)
    user.save!(validate: false)
    sign_in(user, event: :authentication)
    redirect_to redirect_url, notice: message, only_path: true
  end

  def login_message(user)
    key = user.new_record? ? 'account_created' : 'login_succeed'
    I18n.t("system.messages.#{key}")
  end

  def redirect_url_for(user, origin = nil)
    root_path
  end

  def relative_path(url)
    matches = url.match(/^http(s)?:\/\/[^\/]+(.*)/)
    matches ? matches[2] : url
  end

end
