class RemoveTypeOfVehicleColumnToVehicles < ActiveRecord::Migration[6.1]
  def change
    remove_column :vehicles, :type_of_vehicle
  end
end
