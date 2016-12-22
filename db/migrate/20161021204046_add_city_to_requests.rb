class AddCityToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :city, index: true
    add_foreign_key :requests, :cities
  end
end
