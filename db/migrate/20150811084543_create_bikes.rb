class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.references :user
      t.boolean :status
      t.string :title
      t.text :description
      t.string :bike_type
      t.integer :wheels
      t.integer :gears
      t.string :suspension
      t.string :sex
      t.integer :price

      t.timestamps null: false
    end
  end
end
