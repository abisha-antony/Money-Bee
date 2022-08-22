# frozen_string_literal: true

class UsersController < ApplicationController



    def register
      @user = User.new(user_params) #User - model's class name
      if @user.save
        user = User.find_by(email: params[:users][:email])
        MainBalance.create!(
          users_id: user["id"]
        )
        session[:user] = user
        flash[:notice] = "Sign up Successfull!"
        redirect_to "/home"
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
