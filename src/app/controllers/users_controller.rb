class UsersController < ApplicationController
  before_action :check_for_user

  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = @cur_user
  end

  def new
    @user = User.new
  end

  def delete
    @user.destroy
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(users_path)
    else
      render 'new'
    end
  end

  def update
    if @cur_user.update(user_params)
      redirect_to(root_path)
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :id, :access)
    end
end
