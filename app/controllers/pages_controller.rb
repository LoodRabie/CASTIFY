class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @castings = Casting.all
    @dancers = Dancer.all
  end
end
