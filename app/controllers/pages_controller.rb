class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

    def home
      @dancers = Dancer.all
      @castings = Casting.all
      if params[:query].present?
        @dancers = @dancers.where("name ILIKE ?", "%#{params[:query]}%")
        @castings = @castings.where("name ILIKE ?", "%#{params[:query]}%")
      end
    end
end
