class FixUsersColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :firstname, :first_name
    rename_column :users, :lastname, :last_name
    rename_column :users, :isadmin, :is_admin
  end
end
