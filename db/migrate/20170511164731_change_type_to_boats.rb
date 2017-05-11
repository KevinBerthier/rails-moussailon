class ChangeTypeToBoats < ActiveRecord::Migration[5.1]
  def change
    rename_column :boats, :type, :gender
  end
end
