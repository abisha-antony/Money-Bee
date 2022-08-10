class ForgotPasswordController < ApplicationController
    def index
    @user = User.all
     PostMailer.with(user:@user, post:@post).deliver_later
    end
end
