class SwapsController < ApplicationController
  before_action :get_swap, :get_user
  skip_before_action :get_swap, only: [:check_for_user, :add_swap]

  def get_swap
    @swap = Swap.find(params[:format])
  end
  def get_user
    @user = User.find(session[:user_id])
  end
  def take_shift
    @swap.taker = @user
    @swap.save
    redirect_to :back
  end
  def confirm_swap
    shift = @swap.shift
    shift.user = @swap.taker
    shift.save
    @swap.destroy
    redirect_to :back
  end
  def deny_swap
    @swap.destroy
    redirect_to :back
  end
  def add_swap
    shift = Shift.find(params[:format])
    @swap = Swap.new
    @swap.shift = shift
    @swap.save
    redirect_to :back
  end
  def remove_swap
    @swap.destroy
    redirect_to :back
  end
  def check_for_user
    if !session[:user_id]
      redirect_to(login_path)
    else
      @user = User.find(session[:user_id])
    end
  end
end
