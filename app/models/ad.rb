class Ad < ActiveRecord::Base
  belongs_to :user
  validates :sex, presence: true, length: {minimum: 5}
end
