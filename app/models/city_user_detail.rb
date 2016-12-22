class CityUserDetail < ActiveRecord::Base
  belongs_to :user_detail
  belongs_to :city
end