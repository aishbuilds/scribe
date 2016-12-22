class AddLanguageToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :language, index: true
    add_foreign_key :requests, :languages
  end
end
