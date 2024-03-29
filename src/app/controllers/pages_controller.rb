class PagesController < ApplicationController
  before_action :check_for_user

  def home
    @shifts = @user.shifts
  end

  def master_schedule
    @shifts = Shift.all.order(start_time: :asc)
    @users = User.all
  end
  
  def swap_board
    @swaps = Swap.all
  end

end
