class RequestsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:request_confirm, :confirm]

  def index
    @user = current_user
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

  def request_confirm
    @request = Request.find(params[:id])
  end

  def confirm
    @request = Request.find(params[:request_id])
    valid_otp, message = Otp.verify_otp(params)
    if valid_otp
      user = UserDetail.find_by(phone_no: params[:phone_no]).user
      request_volunteer = RequestVolunteer.create(request: @request, user: user)
      priority = request_volunteer.assign_priority
      @request.send_confirm_message(request_volunteer)
      render json: {status: 200, message: "Success", priority: priority}
    else
      render json: {status: 500, message: message}
    end
  end

  private
  def request_params
    params.require(:request).permit(:exam, :subject, :address, :start_time, :end_time, :note, :user_id, :city_id, :language_id, :locality_id)
  end
end
