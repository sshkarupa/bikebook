class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.references :user
      t.boolean :status
      t.string :title
      t.text :description
      t.string :type
      t.integer :wheels
      t.integer :gears
      t.string :suspension
      t.string :sex
      t.integer :price

      t.timestamps null: false
    end
  end
end
