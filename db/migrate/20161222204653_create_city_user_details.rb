class CreateCityUserDetails < ActiveRecord::Migration
  def change
    create_table :city_user_details do |t|
      t.belongs_to :city, index: true
      t.belongs_to :user_detail, index: true
      t.timestamps null: false
    end
  end
end
