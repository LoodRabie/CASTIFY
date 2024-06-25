class DancersController < ApplicationController
  before_action :set_dancer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @dancer = Dancer.new
  end

  def create
    @dancer = Dancer.new(dancer_params)
    @dancer.user = current_user  # Assuming each dancer is associated with a user

    if @dancer.save
      redirect_to @dancer, notice: 'Dancer profile was successfully created.'
    else
      render :new
    end
  end


      def edit
      end

      def show
      end

  def update
    @dancer = Dancer.find(params[:id])
    if @dancer.update(dancer_params)
      redirect_to dancer_path(@dancer), notice: 'Dancer profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dancer.destroy
    redirect_to dancers_url, notice: 'Dancer profile was successfully deleted.'
  end

  def my_auditions
    @dancer = current_user.dancers.find(params[:id])
    @auditions = @dancer.auditions
  end

  private

  def set_dancer
    @dancer = Dancer.find(params[:id])
  end

  def dancer_params
    params.require(:dancer).permit(:name, :age, :location, :bio)
  end
end
