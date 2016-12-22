class AddLocalityToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :locality, index: true
    add_foreign_key :requests, :localities
  end
end
