class AddUserToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user, index: true
    add_foreign_key :requests, :users
  end
end
