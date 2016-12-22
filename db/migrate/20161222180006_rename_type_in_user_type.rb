class RenameTypeInUserType < ActiveRecord::Migration
  def change
    rename_column :user_types, :type, :name
  end
end
