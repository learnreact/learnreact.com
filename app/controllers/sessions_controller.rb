class SessionsController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create
    return_to = session.delete(:return_to)
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :provider_id => auth['uid'].to_s).first || User.create_with_omniauth(auth)

    # Can I just upsert the email address without the status and will it default to { status: "subscribed"} ?
    # If not, I need to set the user in two phases, to make sure that i don't resubscribe someone who has intentionally unsubbed.
    # https://github.com/amro/gibbon/blob/master/README.markdown
    # Gibbon::Request.lists("f97aebbc64").members(Digest::MD5.hexdigest("mijoch@gmail.com")).upsert(body:  {email_address: "mijoch@gmail.com"})

    reset_session
    session[:user_id] = user.id
    redirect_to return_to || root_url, :notice => 'Signed in!'
  end

  def destroy
    return_to = session.delete(:return_to)
    reset_session
    redirect_to return_to || root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
