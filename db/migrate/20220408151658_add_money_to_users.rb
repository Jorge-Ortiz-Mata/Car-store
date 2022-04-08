class AddMoneyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :money, :decimal, default: 149000
  end
end
