class AddPhoneNoToUserDetail < ActiveRecord::Migration
  def change
    add_column :user_details, :phone_no, :string
  end
end
