class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %i[admin user]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bikes, dependent: :destroy
  validates :email, :phone, :name, presence: true

  before_create :set_role

  private
  def set_role
    self.role = 'user'
  end

  rails_admin do

    list do
      field :email
      field :name
      field :role
      field :bikes do
        pretty_value do
          value.count
        end
      end
    end

    edit do
      field :email
      field :name
      field :role, :enum do
        enum do
          ROLES
        end
      end
      field :password
    end
  end

end
