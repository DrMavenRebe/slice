class CreatePodiumPodiumPlacers < ActiveRecord::Migration
  def change
    create_table :podium_podium_placers do |t|
      t.integer :place
      t.integer :podium_id
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
