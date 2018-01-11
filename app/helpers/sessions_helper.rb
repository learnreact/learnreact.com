module SessionsHelper
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def user_chan?
    current_user&.provider_id == 658360 || current_user&.provider_id == 35316290
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to session[:return_to] || root_url, :alert => 'You need to sign in for access to this page.'
    end
  end

  def set_session_return_to
    session[:return_to] = request.url
  end
end
