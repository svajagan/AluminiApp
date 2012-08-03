class UsersController < ApplicationController

  before_filter :check_not_logged_in, :only => [:login, :new, :signup]
  
  def login
    if request.post?
       @user = User.authenticate(params[:user][:email], params[:user][:password])
       if @user.is_a?(User)
        flash[:notice]="User logged in Successfully"
        session[:current_user]=@user
        redirect_to courses_path
       else
        flash[:error]="Incorrect email or password. Please try again."
        redirect_to login_users_path
       end
    end
  end
  
  
  def new
    @user= User.new
  end 
  
  def signup
    @user = User.new(params[:user])
    if @user.save 
       flash[:notice] = "Congrats! You've successfully signed up! Please login to continue"
      redirect_to login_users_path
    else
      flash[:error] = "Sorr, we couldn't sign you up because of the following errors!"
      render :action => :new
    end
  end
  
 def logout
  session[:current_user]=nil
  flash[:notice]="You have logged out Successfully"
  redirect_to courses_path
 end  
end
