class ProducersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_producer, only: [:show, :edit, :update, :destroy]

  def new
    @producer = current_user.build_producer
  end

  def edit
  end

  def show
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

  def set_producer
    @producer = Producer.find(params[:producer_id])
  end

  def producer_params
    params.require(:producer).permit(:name, :bio)
  end
end
