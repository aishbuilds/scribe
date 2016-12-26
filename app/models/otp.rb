class Otp
  def self.verify_otp(params)
    phone_no = params[:phone_no]
    otp = params[:otp]
    user = UserDetail.find_by(phone_no: phone_no).try(:user)
    if user
      user_otp = UserOtp.find_by(user: user, otp: otp)
      if user_otp
        UserOtp.destroy_if_otp_exists_for_user(user_otp)
        return true
      else
        return false, "Invalid OTP."
      end
    else
      return false, "OTP does not exist for user."
    end
  end

  def self.generate_otp
    rand.to_s[2..5]
  end
end