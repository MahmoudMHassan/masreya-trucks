class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def show
     if User.exists?(params[:id])
    @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
     User.find_by_id(self.current_user.id).delete if User.find_by_id(self.current_user.id)!=nil
  end

  def new
  	@user = User.new
  end

  def create 
  	  @user = User.new(params.require(:user).permit(:email, :password , :fname , :lname, :country, :phone ,:validated))
    if  @user.save
      log_in(@user)
      redirect_to "/users/#{@user.id}"
    else
    render 'create'

  end 
end 
end
