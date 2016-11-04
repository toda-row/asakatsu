class AddTeamAndNameAndTelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team, :string
    add_column :users, :name, :string
    add_column :users, :tel, :string
  end
end
