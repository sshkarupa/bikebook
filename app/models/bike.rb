class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :bike_type, :title, :price, :city, :department, presence: true
  validates :price, :numericality => {:only_integer => true}
  before_create :price_format
  before_validation :price_format

  protected
  def price_format
    self.price = price.gsub(/[\s]/, '')
  end

  class << self
    def gears
      30.downto 1
    end
    def wheels
      29.downto 1
    end
  end
end
