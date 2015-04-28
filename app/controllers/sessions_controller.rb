class SessionsController < ApplicationController
  
   def new
  end
   def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to the language Q&A!"
      log_in @user
      redirect_back_or_default(root_url)
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
 
  def destroy
    log_out
    redirect_to root_url
  end
  
end
