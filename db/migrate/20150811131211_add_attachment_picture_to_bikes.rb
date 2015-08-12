class AddAttachmentPictureToBikes < ActiveRecord::Migration
  def change
    add_attachment :pictures, :img
  end
end
