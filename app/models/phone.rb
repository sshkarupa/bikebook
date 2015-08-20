class Phone < ActiveRecord::Base
  belongs_to :user
  validates :number, presence: true

  before_create :phone_format

  def phone_format
    self.number = number.gsub(/[\s()-]/, '')
  end
end
