class DropUsersRolesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :users_roles
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
