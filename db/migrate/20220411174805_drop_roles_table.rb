class DropRolesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :roles
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
