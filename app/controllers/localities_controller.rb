class LocalitiesController < ApplicationController
  def index
    @localities = Locality.where(status: Locality.statuses["active"]).map(&:name)
    respond_to do |format|
      format.json { render json: {localities: @localities, :status => 200 } }
    end
  end
end
