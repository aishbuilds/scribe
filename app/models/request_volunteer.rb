class RequestVolunteer < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  def assign_priority
    last_priority = RequestVolunteer.where(request_id: self.request_id).where.not(:id => self.id).order(:priority).try(:last).try(:priority)
    self.priority = last_priority ?  last_priority + 1 : 1
    self.save
    self.priority
  end
end
