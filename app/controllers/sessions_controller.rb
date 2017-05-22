class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def email
    params[:session][:email]
  end

  def password
    params[:session][:password]
  end
end
