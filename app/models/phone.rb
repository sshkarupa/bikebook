class Phone < ActiveRecord::Base
  belongs_to :user
  validates :number, presence: true, uniqueness: true

  before_create :phone_format
  before_validation :phone_format

  def phone_format
    self.number = number.gsub(/[\s()-]/, '')
  end
end
