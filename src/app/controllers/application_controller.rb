class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_for_user
    if !session[:user_id]
      redirect_to(login_path)
    elsif User.exists?(session[:user_id])
      @user = User.find(session[:user_id])
    else
      reset_session
      redirect_to login_path
    end
  end
end
