class HomeController < ApplicationController
  def index
    @apartments = Apartment.all.sample(9)
  end
end
