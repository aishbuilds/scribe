class AddCities < ActiveRecord::Migration
  def change
    cities = ['Bangalore', 'Mumbai']
    cities.each do |city|
      City.create(name: city)
    end
  end
end
