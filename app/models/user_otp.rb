class UserOtp < ActiveRecord::Base
  belongs_to :user

  def self.destroy_if_otp_exists_for_user(user_otp)
    user_otp.destroy if user_otp
  end
end
