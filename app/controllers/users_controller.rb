class UsersController < ApplicationController
	include SessionsHelper
	before_action :set_user, only: [:show, :edit, :update, :destroy, :correct_user]
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]

  def index
  	 @users = User.where(activated: true).paginate(page: params[:page])
  end 

  def new
  	@user = User.new
  end

  def show
    redirect_to root_url and return unless current_user
  end

  def create
  	@user = User.new(user_params)
    
  	if @user.save
  		@user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit

  end 

  def update
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profile Updated"
  		redirect_to @user

  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end 
  
  private
   	def set_user
   		 @user = User.find(params[:id])
   	end 

   	def logged_in_user
   		unless logged_in?
   			store_location
   			flash[:danger] = "Please log in"
   			redirect_to login_url
   		end
   	end

   	def correct_user
   		redirect_to(root_url) unless @user == current_user
   	end 
   	def user_params
   		params.require(:user).permit(:name, :email, :password, :password_confirmation)
   	end
end	
