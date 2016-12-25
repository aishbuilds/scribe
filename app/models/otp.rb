class Otp
  def self.generate_otp
    rand.to_s[2..5]
  end
end