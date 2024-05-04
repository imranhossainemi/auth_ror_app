class AddBlockedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rebuff, :boolean, default: false
  end
end
