class CreateLocalityUserDetails < ActiveRecord::Migration
  def change
    create_table :locality_user_details do |t|
      t.belongs_to :locality, index: true
      t.belongs_to :user_detail, index: true
      t.timestamps null: false
    end
  end
end
