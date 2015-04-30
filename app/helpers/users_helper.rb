module UsersHelper
    def log_in(user)
        session[:user_id] = user.id
        self.current_user = user
    end
    #setter method
    def current_user=(user)
        @current_user = (user)
    end
    #getter method
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !current_user.nil?
    end

    def sign_out
        session[:user_id] = nil
        redirect_to root_path
    end

end
