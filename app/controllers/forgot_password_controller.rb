# frozen_string_literal: true

class ForgotPasswordController < ApplicationController
  def render_forgot_pw
    render 'mb/forgot_password'
  end

  def render_otp
    render 'mb/otp'
  end

  def generate_otp
    email = params[:email]
    is_exist = User.find_by(email: email)
    $fpw_user = is_exist
    if is_exist.nil?
      flash[:error] = "Email does'nt exist"
      redirect_to '/forgot_password'
    else
      session[:otp] = gen_random
      PostMailer.with(to_email: email, otp: session[:otp], user: is_exist['name']).forgot_password.deliver_now
      render 'mb/otp'
    end
  end

  def verify_otp
    user_otp = params[:otp]
    if user_otp == session[:otp]
      render 'mb/new_password'
    else
      flash[:error] = 'Invalid Code'
      redirect_to '/otp'
    end
  end

  def new_password
    p params[:password]
    hashed_pw = BCrypt::Password.create(params[:password])
    p hashed_pw
    p '===================='
    @update_pw = User.find($fpw_user['id'])
    p @update_pw
    @update_pw.update(
      password_digest: params[:password]
    )
    @update_pw.save
    p @update_pw.errors.full_messages
    flash[:notice] = 'Password Reset Successfull!!'
    redirect_to '/login'
  end

  def test_short
    render 'mb/new_password'
  end

  private

  def gen_random
    otp = 6.times.map { rand(10) }.join
    otp.to_s
  end
end
