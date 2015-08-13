class Picture < ActiveRecord::Base
  belongs_to :bike

  has_attached_file :img, :styles => { :medium_l => "600x450#", :medium => "300x300#", :thumb => "100x100#" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
