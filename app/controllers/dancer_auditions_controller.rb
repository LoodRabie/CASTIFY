class DancerAuditionsController < ApplicationController
  before_action :authenticate_user! # Ensure user is signed in

  def create
    @audition = Audition.find(params[:audition_id])
    @dancer_audition = DancerAudition.new(audition: @audition, dancer: current_user.dancer)

    if @dancer_audition.save
      redirect_to @audition, notice: 'Successfully applied to audition.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to apply to audition.'
    end
  end

  def destroy
    @dancer_audition = DancerAudition.find(params[:id])

    if @dancer_audition.destroy
      redirect_to my_auditions_path, notice: 'Audition application withdrawn.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to withdraw audition application.'
    end
  end
end
