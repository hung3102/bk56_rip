class SessionsController < ApplicationController
   def new
  end
   def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to the language Q&A!"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
 
  def destroy
    log_out
    redirect_to root_url
  end
  
   # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
