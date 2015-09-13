class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :traveller_id, :trip_id
      t.timestamps
    end
  end
end
