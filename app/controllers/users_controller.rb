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
  def bookmark
    @bookmarks = Bookmark.where(user_id: self.current_user.id).first(10)
    
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

    @email = params[:user][:email]
    @password = params[:user][:password]
    @phone = params[:user][:phone]
    @fname = params[:user][:fname]
    @lname = params[:user][:lname]
    @country = params[:user][:country]
    @avatar = params[:user][:avatar]
    @blank = false
    @usedemail = false
    if @email.blank? || @password.blank? || @phone.blank? || @fname.blank? || @lname.blank? || @country.blank?
      @blank = true
      render 'new'
      return
    end

    @user = User.new(params.require(:user).permit(:email, :password , :fname , :lname, :country, :phone, :validated, :avatar))
    if  @user.save
      log_in(@user)
      redirect_to "/users/#{@user.id}"
      #@buyer= Buyer.new(@user.id)
      #@buyer.save
      #render 'users/:id'
    else
      render 'new'

    end
  end
  def logout
    sign_out
  end
  def signin

  end
  def login
    @email = params[:login][:email]
    @password = params[:login][:password]
    @blank = false
    @wrong = false

    user = User.where(:email => @email.downcase).first
    if @email.blank? || @password.blank?

      @blank = true
      render 'signin'
      return
    end
    if user!= nil && User.login?(@email.downcase,@password)
      log_in user
      redirect_to "/users/#{user.id}"
      return

    else
      @wrong = true
      render 'signin'
      return
    end

  end
   def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user].permit(:email,:password,:fname,:lname,:country,:phone,:validated, :avatar))
      redirect_to "/users/#{@user.id}"
    else
      render 'edit'
    end
  end
  
  def changetoseller
    @seller.user_id = self.current_user.id
    @seller.save
  end
end
