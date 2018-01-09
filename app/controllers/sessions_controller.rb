class SessionsController < ApplicationController
  def new
    redirect_to Rails.env.production? ? "https://learnreact.com/auth/github" : "/auth/github"
  end

  def create
    return_to = session.delete(:return_to)
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :provider_id => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to return_to || root_path, :notice => 'Signed in!'
  end

  def destroy
    return_to = session.delete(:return_to)
    reset_session
    redirect_to return_to || root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
