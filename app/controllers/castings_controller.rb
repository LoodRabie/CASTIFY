class CastingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_producer
  before_action :set_casting, only: [:show, :edit, :update, :destroy]

  def new
    @casting = @producer.castings.build
  end

  def create
    @casting = @producer.castings.build(casting_params)
    if @casting.save
      redirect_to producer_casting_path(@producer, @casting), notice: 'Casting was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @casting = Casting.find(params[:id])
    if @casting.update(casting_params)
      redirect_to producer_casting_path(@producer, @casting), notice: 'Casting was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def index
    @castings = @producer.castings
  end

  def show
  end

  def destroy
    @casting.destroy
    redirect_to producer_castings_path(@producer, @casting), notice: 'Casting was successfully destroyed.'
  end

  private

  def set_producer
    @producer = Producer.find(params[:producer_id])
  end

  def set_casting
    @casting = @producer.castings.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit(:title, :description, :dancing_style, :deadline, :location)
  end
end
