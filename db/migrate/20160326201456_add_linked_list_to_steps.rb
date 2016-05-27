class AddLinkedListToSteps < ActiveRecord::Migration
  def change
    add_column :events_steps, :last_event_step_id, :integer
    add_column :events_steps, :day_final, :boolean, default: false, null: false
  end
end
