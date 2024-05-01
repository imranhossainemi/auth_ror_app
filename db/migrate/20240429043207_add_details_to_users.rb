class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_login_time, :datetime
    add_column :users, :registration_time, :datetime
    add_column :users, :status, :string
  end
end
