class AddUserTypeValues < ActiveRecord::Migration
  def change
    user_types = ["scribe_requester", "scribe_volunteer"]

    user_types.each do |type|
      UserType.create(name: type)
    end
  end
end
