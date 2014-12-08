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

  def remove_shift
    Shift.find(params[:format]).destroy
    redirect_to :back
  end

  def destroy
    set_shift
    @shift.destroy
    redirect_to :back
  end

  def edit
    set_shift
  end

  private
    def set_shift
      @shift = Shift.find(params[:id])
    end
    def shift_params
      params.require(:shift).permit(:user_id, :start_time, :end_time)
    end
end
