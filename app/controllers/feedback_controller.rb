class FeedbackController < ApplicationController

  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:success] = 'Сообщение отправлено'
      redirect_to root_path
    else
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:title, :description)
  end
end
