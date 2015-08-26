class AddDefaultValueToBikeStatus < ActiveRecord::Migration
  def change
    change_column :bikes, :status, :integer, default: 1
  end
end
