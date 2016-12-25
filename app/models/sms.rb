class Sms
  EXOTEL_NUMBER = '09243422233'
  def self.send_exotel_sms(phone_number, sms_string)
    begin
      response = Exotel::Sms.send(:from => EXOTEL_NUMBER, :to => phone_number,
                                  :body => sms_string, :priority => 1)
    rescue => error
      Rails.logger.error "Failed to send sms to phone_number:" + phone_number.to_s
    end
    Rails.logger.debug "Sending sms! #{response.inspect}"
  end
end