class SessionsController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user 
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to new_session_path, :flash => {:error => "Incorrect email or password, please try again!"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
