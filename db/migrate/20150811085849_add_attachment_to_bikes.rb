class AddAttachmentToBikes < ActiveRecord::Migration
  def self.up
    add_attachment :bikes, :picture
  end

  def self.down
    remove_attachment :bikes, :picture
  end
end
