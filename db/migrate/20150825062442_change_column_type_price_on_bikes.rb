class ChangeColumnTypePriceOnBikes < ActiveRecord::Migration
  def change
    change_column :bikes, :price, :string
  end
end
