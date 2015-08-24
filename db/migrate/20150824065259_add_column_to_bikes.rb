class AddColumnToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :age, :integer
  end
end
