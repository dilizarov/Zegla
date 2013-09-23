class SessionsController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]
  before_filter :require_current_user!, :only => [:destroy]
  
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if @user.nil?
      flash.now[:errors] = ["Credentials were wrong"]
      @user = User.new(:username => params[:user][:username])
      render "new"
    else
      self.current_user = @user
      redirect_to user_url(@user)
    end
  end
  
  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
  
  def new
    @user = User.new
  end
end