class City < ActiveRecord::Base
  has_many :requests
  has_many :localities
end
