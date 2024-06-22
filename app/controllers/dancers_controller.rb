class DancersController < ApplicationController
  before_action :authenticate_user!

  def new
    @dancer = current_user.build_dancer
  end

  def edit
    @dancer = current_user.dancer
  end

  def show
    @dancer = current_user.dancer
  end

  def update
    @dancer = Dancer.find(params[:id])
    @dancer.update(dancer_params)
    redirect_to dancer_path(@dancer)
  end

  def create
    @dancer = current_user.build_dancer(dancer_params)
    if @dancer.save
      redirect_to @dancer, notice: 'Dancer profile was successfully created.'
    else
      render :new
    end
  end

  private

  def dancer_params
    params.require(:dancer).permit(:name, :age, :location, :bio)
  end
end
