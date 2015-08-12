class AddPicturesToBikes < ActiveRecord::Migration
  def change
    add_reference :pictures, :bike, index: true
  end
end
