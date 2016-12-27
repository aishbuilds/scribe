class AddStatusToLocalities < ActiveRecord::Migration
  def change
    add_column :localities, :status, :integer, default: 1
  end
end
