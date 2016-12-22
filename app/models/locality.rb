class Locality < ActiveRecord::Base
  belongs_to :city
  has_many :requests
end
