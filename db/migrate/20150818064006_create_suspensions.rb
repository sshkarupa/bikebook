class CreateSuspensions < ActiveRecord::Migration
  def change
    create_table :suspensions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
