class AddSampleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sample, :string
  end
end
