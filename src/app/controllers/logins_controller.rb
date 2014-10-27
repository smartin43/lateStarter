class LoginsController < ApplicationController
  def login
    if session[:user_id] && User.exists?(session[:user_id])
      redirect_to(home_path)
    end
  end

  def try_login
    unless User.exists?(:username => params[:username])
      redirect_to(login_path) 
      return
    end
    @user = User.where(:username => params[:username]).first.authenticate(params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to(home_path)
    else
      redirect_to(login_path)
    end
  end

  def logout
    reset_session
    redirect_to(login_path)
  end
end
