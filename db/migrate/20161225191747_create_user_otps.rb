class CreateUserOtps < ActiveRecord::Migration
  def change
    create_table :user_otps do |t|
      t.references :user, index: true
      t.string :otp

      t.timestamps null: false
    end
    add_foreign_key :user_otps, :users
  end
end
