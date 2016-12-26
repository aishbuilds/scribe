class CreateRequestVolunteers < ActiveRecord::Migration
  def change
    create_table :request_volunteers do |t|
      t.references :request, index: true
      t.references :user, index: true
      t.integer :priority

      t.timestamps null: false
    end
    add_foreign_key :request_volunteers, :requests
    add_foreign_key :request_volunteers, :users
  end
end
