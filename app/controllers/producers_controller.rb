class ProducersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_producer, only: %i[show edit update destroy]

  def new
    @producer = current_user.build_producer
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def show
    @producer = Producer.find(params[:id])
    @castings = @producer.castings

    if @castings.any?
      @auditions = @castings.map(&:auditions).flatten
    else
      @auditions = []
    end
  end

  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      redirect_to @producer, notice: 'Producer was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @producer = current_user.build_producer(producer_params)
    if @producer.save
      redirect_to @producer, notice: 'Producer profile was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy
    redirect_to producers_url, notice: 'Producer was successfully destroyed.'
  end

  private

  def set_producer
    @producer = Producer.find(params[:id])
  end

  def producer_params
    params.require(:producer).permit(:name, :bio)
  end
end
