class Phone < ActiveRecord::Base
  belongs_to :user
  validates :number, presence: true, uniqueness: true

  before_update :drop_activation
  before_create :phone_format
  before_validation :phone_format

  protected
  def phone_format
    self.number = number.gsub(/[\s()-]/, '')
  end

  def drop_activation
    if self.number_changed?
      self.activated=nil
    end
  end

  rails_admin do

    list do
      field :number
      field :activated
      field :user
    end

    edit do
      field :number
      field :activated
      field :user
    end
  end

end
