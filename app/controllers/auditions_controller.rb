class AuditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_casting, only: [:new, :create, :index]
  before_action :set_audition, only: [:show]

  # GET /castings/:casting_id/auditions/new
  def new
    if current_user.dancer && current_user.dancer.auditions.where(casting: @casting).exists?
      redirect_to root_path, alert: 'You already have an audition for this casting.'
    else
      @audition = @casting.auditions.build
    end
  end

  # POST /castings/:casting_id/auditions
  def create
    @audition = current_user.dancer.auditions.build(audition_params)
    @audition.casting = @casting

    if @audition.save
      redirect_to root_path, notice: 'Audition was successfully created.'
    else
      render :new
    end
  end

  # GET /castings/:casting_id/auditions
  def index
    @auditions = @casting.auditions
  end

  # GET /auditions/:id
  def show
    redirect_to root_path, alert: 'Access denied.' unless current_user.producer
  end

  private

  def set_casting
    @casting = Casting.find(params[:casting_id])
  end

  def set_audition
    @audition = Audition.find(params[:id])
  end

  def audition_params
    params.require(:audition).permit(:status, :date)
  end
end
