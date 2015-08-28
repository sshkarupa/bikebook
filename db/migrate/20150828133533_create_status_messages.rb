class CreateStatusMessages < ActiveRecord::Migration
  def change
    create_table :status_messages do |t|
      t.string :name
      t.string :message

      t.timestamps null: false
    end
  end
end
