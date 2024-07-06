class AuditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_casting, only: [:new, :create]
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
    @audition = @casting.auditions.build(audition_params)
    @audition.status = 'pending'
    @audition.date = Date.today
    if @audition.save
      DancerAudition.create(dancer: current_user.dancer, audition: @audition)
      redirect_to audition_path(@audition), notice: 'Audition submitted successfully.'
    else
      render :new
    end
  end

  # GET /castings/:casting_id/auditions
  def index
    if current_user.producer?
      @auditions = @casting.auditions
    elsif current_user.dancer?
      @dancer = Dancer.find(params[:dancer_id])
      @auditions = current_user.dancer.auditions
    else
      redirect_to root_path
    end
  end

  # GET /auditions/:id
  def show
    @dancer_audition = DancerAudition.find_by(audition: @audition)
  end

  def edit
    redirect_to root_path unless current_user.producer?
  end

  def update
    if current_user.producer?
      if @audition.update(audition_params)
        redirect_to audition_path(@audition), notice: 'Audition updated successfully.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  private

  def set_casting
    @casting = Casting.find(params[:casting_id])
  end

  def set_audition
    @audition = Audition.find(params[:id])
  end

  def audition_params
    params.require(:audition).permit(:status, :date, :casting_id, :video)
  end
end
