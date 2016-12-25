class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end

  def new
    @request = Request.new
  end

  def create
    params[:request][:start_time] = DateTime.strptime(params[:request][:start_time], '%m/%d/%Y %I:%M %p')
    params[:request][:end_time] = DateTime.strptime(params[:request][:end_time], '%m/%d/%Y %I:%M %p')
    params[:request][:user_id] = current_user.id
    @request = Request.new(request_params)
    respond_to do |format|
      if @request.save
        @request.broadcast_requests
        format.html {
          redirect_to(@request, notice: 'Your request was successfully submitted.')
        }
      else
        format.html {
          render action: 'new'
        }
      end
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  private
  def request_params
    params.require(:request).permit(:exam, :subject, :address, :start_time, :end_time, :note, :user_id, :city_id, :language_id, :locality_id)
  end
end
