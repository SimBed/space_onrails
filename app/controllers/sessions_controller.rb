class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      #compact code using ternary operator equivalent to if......else
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      #allows for friendly forwarding...previously redirect_to user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    #previously just "log_out"..."if logged_in?"" protects against multiple browser window complexities
    log_out if logged_in?
    redirect_to root_url
  end
end
