class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    # before_action :require_login, except: [:index]

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def index
        puts "how in the..."
    end

    private
        def require_login 
            return redirect_to new_login_path unless current_user
        end
end