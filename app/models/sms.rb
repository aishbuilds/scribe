class Sms
  # EXOTEL_NUMBER = '09243422233'
  # def self.send_exotel_sms(phone_number, sms_string)
  #   begin
  #     response = Exotel::Sms.send(:from => EXOTEL_NUMBER, :to => phone_number,
  #                                 :body => sms_string, :priority => 1)
  #   rescue => error
  #     Rails.logger.error "Failed to send sms to phone_number:" + phone_number.to_s
  #   end
  #   Rails.logger.debug "Sending sms! #{response.inspect}"
  # end

  def initialize(message, recipients)
    @message = message
    @recipients = recipients
    @config = load_config
  end

  def send
    uri = URI.parse(request_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = Net::HTTP.post_form(uri, 'username' => @config[:username], 'hash' => @config[:hash], 'message' => @message, 'sender' => 'Team Scribe', 'numbers' => @recipients)
  end

  private
  def load_config
    YAML.load_file(File.join(Rails.root, "config/textlocal.yml")).deep_symbolize_keys!
  end

  def request_url
    'http://api.textlocal.in/send/?'
  end
end