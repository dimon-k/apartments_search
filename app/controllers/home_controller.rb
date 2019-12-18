class HomeController < ApplicationController
  def index
    @apartments = Apartment.all.sample(40)
  end
end
