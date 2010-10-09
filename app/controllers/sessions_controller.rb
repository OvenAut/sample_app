class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  def create
    user = User.authenticate(params[:session][:email],
                              params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      #session.password = ""
      @title = "Sign in"
      render 'new'
    else
      # sign the user in and redirect to the users page
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    
  end

end
