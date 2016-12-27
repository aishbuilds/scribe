class AddActiveLocalities < ActiveRecord::Migration
  def change
    localities = ["HSR Layout", "Koramangala", "Whitefield", "Bannerghatta Road", "Electronic City"]
    localities.each do |locality|
      l = Locality.find_by(name: locality)
      l.status = 0
      l.save
    end
  end
end
