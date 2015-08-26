class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.references :user
      t.string :status, default: 'on_moderation'
      t.string :title
      t.text :description
      t.integer :bike_type
      t.integer :wheels
      t.integer :gears
      t.integer :suspension
      t.integer :sex
      t.integer :price

      t.timestamps null: false
    end
  end
end
