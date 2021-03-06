class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :bike_type, :title, :price, :city, :department, :pictures, presence: true
  validates :price, :numericality => {:only_integer => true}
  before_create :price_format
  before_validation :price_format
  before_update :drop_moderation

  scope :approved, -> { where status: 'approved' }
  scope :on_moderation, -> { where status: 'on_moderation' }

  protected
  def price_format
    self.price = price.gsub(/[\s]/, '')
  end

  def drop_moderation
    if self.title_changed? || self.description_changed?
      self.status = 'on_moderation'
    end
  end

  class << self
    def gears
      30.downto 1
    end
    def wheels
      29.downto 1
    end
  end


  rails_admin do

    list do
      field :user
      field :status, :enum do
        enum do
          Status.all.map { |c| [ c.name, c.id ] }
        end
      end
      field :title
      field :created_at

    end

    edit do
      field :status, :enum do
        enum do
          Status.all.map { |c| [ c.name, c.name ] }
        end
      end
      field :user
      field :title
      field :description
      field :bike_type
      field :wheels
      field :gears
      field :suspension
      field :sex
      field :age
      field :price
      field :pictures

    end
  end

end
