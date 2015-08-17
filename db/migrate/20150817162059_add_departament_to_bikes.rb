class AddDepartamentToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :department, :integer
  end
end
