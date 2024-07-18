class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @dancers = Dancer.search_by_name_and_age_and_location_and_bio_and_dancing_styles(params[:query])
      @castings = Casting.search_by_title_and_description_and_dancing_styles_and_location_and_deadline(params[:query])
    else
      @dancers = Dancer.all
      @castings = Casting.all
    end
  end
end
