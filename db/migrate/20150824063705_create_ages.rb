class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
