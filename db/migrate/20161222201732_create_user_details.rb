class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, index: true
      t.string :name
      t.integer :gender

      t.timestamps null: false
    end
    add_foreign_key :user_details, :users
  end
end
