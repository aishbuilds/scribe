class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :exam
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.string :note
      t.integer :state

      t.timestamps null: false
    end
  end
end
