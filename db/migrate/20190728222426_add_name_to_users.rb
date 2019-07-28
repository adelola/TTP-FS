class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_index :users, :name
    remove_index :users, :email
    add_index :users, :email, unique: true
  end
end
