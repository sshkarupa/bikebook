class Feedback < ActiveRecord::Base
  validates :title, :description, presence: :true
end
