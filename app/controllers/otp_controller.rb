class OtpController < ApplicationController
  def send_otp
    phone_no = params[:phone_no]
    user = UserDetail.find_by(phone_no: phone_no).try(:user)
    if user
      otp = Otp.generate_otp
      sms_string = "#{otp} is your OTP for Scribe confirmation."
      #Sms.send_exotel_sms(phone_no, sms_string)
      render json: {status: 200}
    else
      render json: {status: 500}
    end
  end
end