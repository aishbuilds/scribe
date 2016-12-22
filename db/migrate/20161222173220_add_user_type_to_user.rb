class AddUserTypeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_type, index: true
    add_foreign_key :users, :user_types
  end
end
