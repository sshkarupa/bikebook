class RenameColumnNameType < ActiveRecord::Migration
  def change
    rename_column :adverts, :type, :bike_type
  end
end
