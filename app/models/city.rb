class City < ActiveRecord::Base
  has_many :requests
  has_many :localities

  has_many :city_user_details
  has_many :user_details, through: :city_user_details
end
