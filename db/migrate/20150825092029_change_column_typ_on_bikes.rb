class ChangeColumnTypOnBikes < ActiveRecord::Migration
  def change
    change_column :bikes, :status, 'integer USING CAST(price AS integer)'
  end
end
