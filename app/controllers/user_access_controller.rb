class UserAccessController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    menu
    render('menu')
  end
  
  def menu
    # display text and links
    
  end

  def login
    # display login form
    
  end
  
  def attempt_login
    auth_user = User.authenticate(params[:email], params[:password])
    if auth_user
      session[:user_id] = auth_user.id
      session[:user_email] = auth_user.email
      flash[:notice] = "Login successful."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Login unsuccessful."
      redirect_to(:action => 'login')
    end
  end
  
  def logout
      session[:user_id] = nil
      session[:user_email] = nil
      flash[:notice] = "Logged out."
      redirect_to(:action => 'login')  
  end


end
