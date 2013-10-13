class UserController < ApplicationController
  # load_and_authorize_resource
   before_filter :authorize
   before_filter :authorize_admin, :only => [:index, :new, :create, :destroy]
  
  def index
    @title = "Listing all users"
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = "Show User #{@user.email}"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    if current_user.admin?
    @user = User.find(params[:id])
    else
      @user = current_user
    end

  end
  
  def update
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      if current_user.admin?
        redirect_to users_path
      else
        redirect_to root_path
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
 
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end
    
  
end