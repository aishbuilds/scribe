class UserDetailsController < ApplicationController
  def create
    params[:user_detail][:cities] = [City.find_by(name: params[:user_detail][:cities])]
    params[:user_detail][:localities] = [Locality.find_by(name: params[:user_detail][:localities])]
    @user_detail = UserDetail.new(request_params)
    if @user_detail.save
      @user_detail.cities = params[:user_detail][:cities]
      @user_detail.localities = params[:user_detail][:localities]
      @user_detail.save
      render json: {status: 200}
    else
      render json: {status: 500}
    end
  end

  private
  def request_params
    params.require(:user_detail).permit(:name, :phone_no, :user_id, :cities, :localities)
  end
end
