class CastingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_casting, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.producer
      @producer = Producer.find(params[:producer_id])
      @castings = Casting.all.includes(:producer)
    else
      @castings = Casting.all
    end
  end

  def new
    @producer = current_user.producer
    @casting = Casting.new
  end

  def create
    @casting = Casting.new(casting_params)
    @casting.producer = current_user.producer
    if @casting.save
      redirect_to casting_path(@casting), notice: 'Casting was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @casting = Casting.find(params[:casting_id])
    if @casting.update(casting_params)
      redirect_to casting_path(@casting), notice: 'Casting was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def show
    @producer = current_user.producer
    @same_style_castings = Casting.where(dancing_style: @casting.dancing_style).where.not(id: @casting.id)
  end

  def destroy
    @casting.destroy
    redirect_to root_path, notice: 'Casting was successfully destroyed.'
  end

  private

  def set_producer
    @producer = Producer.find(params[:producer_id])
  end

  def set_casting
    @casting = Casting.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit(:title, :description, :dancing_style, :deadline, :location, :photo, :video)
  end
end
