class Picture < ActiveRecord::Base
  belongs_to :bike

  has_attached_file :img,
                    :styles => { :medium_l => "600x450#", :medium => "300x300#", :medium_s => "200x200#", :thumb => "100x100#" },
                    :convert_options => {:medium => "-quality 75 -strip" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :img, :less_than => 1.megabytes
end
