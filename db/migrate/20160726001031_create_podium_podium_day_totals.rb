class CreatePodiumPodiumDayTotals < ActiveRecord::Migration
  def change
    create_table :podium_podium_day_totals do |t|
      t.integer :podium_placer_id
      t.integer :total

      t.timestamps null: false
    end
  end
end
