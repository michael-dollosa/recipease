class AddUsernameFullnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_index :users, :username, unique: true
  end
end
