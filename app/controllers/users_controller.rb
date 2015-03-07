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
     sign_out
  end

  def new
    if self.current_user == nil
  	@user = User.new
    else redirect_to "/users/#{self.current_user.id}"
    end
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
  def logout
    sign_out
  end
  def signin

  end
  def login
    @blank = false
    @wrong = false
    user = User.where(:email => params[:login][:email].downcase).first

    if params[:login][:email].blank? || params[:login][:password].blank?
      @blank = true
      render 'signin'
    return
    end
if user!= nil && User.login?(params[:login][:email].downcase,params[:login][:password])
      log_in user
      redirect_to "/users/#{user.id}"
      return

    else
      @wrong = true
      render 'signin'
      return
    end

  end

end
