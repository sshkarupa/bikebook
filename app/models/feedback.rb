class Feedback < ActiveRecord::Base
  validates :title, :description, presence: :true
  belongs_to :user

  def user_email
    User.find_by(id: user_id).email
  end

  rails_admin do
    list do
      field :user_email
      field :title
      field :description
      field :created_at
    end
  end
end
