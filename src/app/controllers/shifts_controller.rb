class ShiftsController < ApplicationController
  before_action :check_for_user

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    @users = User.all
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to master_schedule_path
    else
      render 'new'
    end
  end

  private
    def shift_params
      params.require(:shift).permit(:user_id, :start_time, :end_time)
    end
end
