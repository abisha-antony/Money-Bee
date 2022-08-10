class FeedbackController < ApplicationController
    def create_feedback
        # render "mb/feedback"
        cur_user_id = session[:user]['id']
        @feedback = Feedback.create!(
            users_id: cur_user_id,
            feedback: params[:feedback]
        )
        if @feedback.save
          flash[:notice] = "Feedback Submitted!"
          redirect_to "/home"
          # PostMailer.with(feedback: @feedback).deliver_later
        else
          flash[:error] = @feedback.errors.full_messages.first
          render plain: "error"
        #   redirect_to "/signup"
        end
    end

    def feedback 
        render 'mb/feedback'
    end

  def search
      @search = Income.where("description LIKE ?",  "%" + params[:q] + "%")
  end
end