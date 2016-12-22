class LocalityUserDetail < ActiveRecord::Base
  belongs_to :user_detail
  belongs_to :locality
end