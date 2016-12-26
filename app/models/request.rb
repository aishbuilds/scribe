class Request < ActiveRecord::Base
  enum state: [ :unverified, :open, :booked, :completed, :failed ]

  belongs_to :user
  belongs_to :city
  belongs_to :locality
  belongs_to :language
  after_create :set_status

  def broadcast_requests
    user_details = UserDetail.fetch_users_in_locality(self.locality)
    sms_requests(user_details.map(&:phone_no).compact.join(","))
    email_requests(user_details.map(&:user))
  end

  def sms_requests(phone_numbers)
    sms_string = "Hi! #{self.user.user_detail.try(:name)} is in need of a scribe on #{self.start_time.to_date} at #{self.address}. Please click on LINK to confirm."
    Sms.new(sms_string, phone_numbers).send
      #phone_numbers.each{|phone_number| Sms.send_exotel_sms(phone_number, sms_string)}
  end

  def email_requests(users)

  end

  private

  def set_status
    self.state = Request.states[:open]
    self.save
  end
end
