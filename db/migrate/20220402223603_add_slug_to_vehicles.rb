class AddSlugToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :slug, :string
    add_index :vehicles, :slug, unique: true
  end
end
