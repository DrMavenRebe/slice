class CreatePodia < ActiveRecord::Migration
  def change
    create_table :podia do |t|
      t.datetime :end_date_at, null: false

      t.timestamps null: false
    end
  end
end
