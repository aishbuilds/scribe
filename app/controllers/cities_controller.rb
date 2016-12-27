class CitiesController < ApplicationController

  def index
    @cities = City.all.map(&:name)
    respond_to do |format|
      format.json { render json: {cities: @cities, :status => 200 } }
    end
  end
end
