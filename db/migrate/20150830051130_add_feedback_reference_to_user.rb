class AddFeedbackReferenceToUser < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :user, index: true
  end
end
