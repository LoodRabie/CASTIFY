class ProducersController < ApplicationController
  before_action :authenticate_user!

  def new
    @producer = current_user.build_producer
  end

  def edit
    @producer = current_user.producer
  end

  def show
    @producer = current_user.producer
    @casting = Casting.find(params[:id])
    @auditions = @casting.auditions
  end

  def update
    @producer = Producer.find(params[:id])
    @producer.update(producer_params)
    redirect_to producer_path(@producer)
  end

  def create
    @producer = current_user.build_producer(producer_params)
    if @producer.save
      redirect_to @producer, notice: 'Producer profile was successfully created.'
    else
      render :new
    end
  end

  private

  def producer_params
    params.require(:producer).permit(:name, :bio)
  end
end
