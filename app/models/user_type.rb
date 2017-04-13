class UserType < ActiveRecord::Base
  has_many :users
  scope :volunteer, -> { find_by(name: 'scribe_volunteer') }
  scope :requester, -> { find_by(name: 'scribe_requester') }
end
