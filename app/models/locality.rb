class Locality < ActiveRecord::Base
  enum status: [ :active, :inactive ]

  belongs_to :city
  has_many :requests

  has_many :locality_user_details
  has_many :user_details, through: :locality_user_details
end
