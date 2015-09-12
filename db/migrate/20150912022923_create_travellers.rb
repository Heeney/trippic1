class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.string :travellername
      t.string :email
      t.timestamps
    end
  end
end
