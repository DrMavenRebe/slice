class AddUserStuff < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :market, :string
    add_column :users, :team, :string
  end
end
