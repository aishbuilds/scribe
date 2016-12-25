class UserDetail < ActiveRecord::Base
  belongs_to :user
  enum gender: [:male, :female]

  has_many :city_user_details
  has_many :cities, through: :city_user_details

  has_many :locality_user_details
  has_many :localities, through: :locality_user_details

  def self.fetch_users_in_locality(locality)
    UserDetail.includes(:localities).where(localities: {id: locality.id})
  end
end
