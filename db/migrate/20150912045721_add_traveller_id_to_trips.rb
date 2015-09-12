class AddTravellerIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :traveller_id, :integer
  end
end
