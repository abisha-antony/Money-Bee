# frozen_string_literal: true

class UsersController < ApplicationController
  def register
    @user = User.new(user_params)
    if @user.save
      user = User.find_by(name: params[:users][:name])
      MainBalance.create!(
        users_id: user['id']
      )
      flash[:notice] = 'Sign up Successfull!'
      session[:user] = user
      redirect_to '/home'

      # PostMailer.with(user: @user).deliver_later
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :password)
  end
end
