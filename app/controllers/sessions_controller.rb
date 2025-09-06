class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email_or_nickname]) ||
           User.find_by(username: params[:email_or_nickname])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user), notice: "Welcome back, #{user.name}"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Wrong email/nickname or password!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_url, status: :see_other, notice: "Signed Out!"
  end

end
