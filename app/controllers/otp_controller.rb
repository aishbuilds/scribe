class OtpController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:send_otp, :verify_otp]

  def send_otp
    phone_no = params[:phone_no]
    user = UserDetail.find_by(phone_no: phone_no).try(:user)
    if user
      otp = Otp.generate_otp
      UserOtp.destroy_if_otp_exists_for_user(UserOtp.find_by(user: user, otp: otp))

      UserOtp.create(user: user, otp: otp)
      sms_string = "#{otp} is your OTP for Scribe confirmation."
      #Sms.send_exotel_sms(phone_no, sms_string)
      render json: {status: 200}
    else
      render json: {status: 500}
    end
  end
end