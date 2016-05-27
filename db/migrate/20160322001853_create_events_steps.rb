class CreateEventsSteps < ActiveRecord::Migration
  def change
    create_table :events_steps do |t|
      t.integer :user_id, null: false
      t.integer :daily_steps, null: false, default: 0
      t.timestamps null: false
    end
  end
end
