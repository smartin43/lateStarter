class SwapsController < ApplicationController
  before_action :set_swap, only: [:show, :edit, :update, :destroy]
  before_action :check_for_user, only: [:take_shift]

  # GET /swaps
  # GET /swaps.json
  def index
    @swaps = Swap.all
  end

  # GET /swaps/1
  # GET /swaps/1.json
  def show
  end

  # GET /swaps/new
  def new
    @swap = Swap.new
  end

  # GET /swaps/1/edit
  def edit
  end

  # POST /swaps
  # POST /swaps.json
  def create
    @swap = Swap.new(swap_params)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: 'Swap was successfully created.' }
        format.json { render :show, status: :created, location: @swap }
      else
        format.html { render :new }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swaps/1
  # PATCH/PUT /swaps/1.json
  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to @swap, notice: 'Swap was successfully updated.' }
        format.json { render :show, status: :ok, location: @swap }
      else
        format.html { render :edit }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1
  # DELETE /swaps/1.json
  def destroy
    @swap.destroy
    respond_to do |format|
      format.html { redirect_to swaps_url, notice: 'Swap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



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



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap
      @swap = Swap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swap_params
      params.require(:swap).permit(:owner_id, :taker_id, :shift_id)
    end
end
