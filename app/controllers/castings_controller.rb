class CastingsController < ApplicationController
  class CastingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_producer

    def new
      @casting = @producer.castings.build
      puts @producer.inspect
      puts @casting.inspect
    end

    def create
      @casting = @producer.castings.build(casting_params)
      if @casting.save
        redirect_to producer_casting_path(@producer, @casting), notice: 'Casting was successfully created.'
      else
        render :new
      end
    end

    private

    def set_producer
      @producer = Producer.find(params[:producer_id])
    end

    def casting_params
      params.require(:casting).permit(:title, :description, :dancing_style, :deadline, :location, :producer_id)
    end
  end
end
