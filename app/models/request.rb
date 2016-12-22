class Request < ActiveRecord::Base
  enum state: [ :unverified, :open, :booked, :completed, :failed ]

  belongs_to :user
  belongs_to :city
  belongs_to :language
  after_create :set_status

  private
  def set_status
    self.state = Request.states[:unverified]
    self.save
  end
end
