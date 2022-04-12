class CreateProfilePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_positions do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
