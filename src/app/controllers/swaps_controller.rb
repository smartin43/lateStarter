class SwapsController < ApplicationController
  def take_shift
    swap = Swap.find(params[:format])
    swap.taker = @user
    swap.save
    redirect_to :back
  end
  def confirm_swap
    swap = Swap.find(params[:format])
    shift = swap.shift
    shift.user = swap.taker
    shift.save
    swap.destroy
    redirect_to :back
  end
  def deny_swap
    swap = Swap.find(params[:format])
    swap.destroy
    redirect_to :back
  end
  def add_swap
    shift = Shift.find(params[:format])
    swap = Swap.new
    swap.shift = shift
    swap.save
    redirect_to :back
  end
  def remove_swap
    swap = Swap.find(params[:format])
    swap.destroy
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