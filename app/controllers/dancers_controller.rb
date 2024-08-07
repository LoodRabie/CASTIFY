class DancersController < ApplicationController
  before_action :set_dancer, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def new
    @dancer = current_user.build_dancer
  end

  def index
    @dancers = Dancer.all
  end

  def edit
    @dancer = Dancer.find(params[:id])
  end

  def show
  end

  def create
    @dancer = current_user.build_dancer(dancer_params)
    if @dancer.save
      redirect_to @dancer, notice: 'Dancer profile was successfully created.'
    else
      render :new
    end
  end

  def update
    @dancer = Dancer.find(params[:id])
    if @dancer.update(dancer_params)
      redirect_to @dancer, notice: 'Dancer profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dancer.destroy
    redirect_to dancers_url, notice: 'Dancer profile was successfully deleted.'
  end

  def my_auditions
    @dancer = current_user.dancer
    @auditions = @dancer.auditions
  end

  private

  def set_dancer
    @dancer = Dancer.find(params[:id])
  end

  def dancer_params
    params.require(:dancer).permit(:name, :age, :location, :bio, :dancing_styles, :profile_picture)
  end
end
