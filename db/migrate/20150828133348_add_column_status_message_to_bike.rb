class AddColumnStatusMessageToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :status_message, :string
  end
end
