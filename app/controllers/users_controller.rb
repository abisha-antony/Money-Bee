class UsersController < ApplicationController
    def register
      @user = User.new(user_params) #User - model's class name
      if @user.save
        flash[:notice] = "Sign up Successfull!"
        redirect_to "/login"
        # PostMailer.with(user: @user).deliver_later
      else
        flash[:error] = @user.errors.full_messages.first
        redirect_to "/signup"
      end
    end

    private
    def user_params
       params.require(:users).permit(:name, :email, :password)
    end
end
