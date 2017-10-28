class SessionsController < ApplicationController
    # skip_before_action :require_login, except: [:destroy]

    def new
        variable = "this"
        puts variable
    end

    def create
        flash[:errors] ||= []

        @user = User.find_by_email(params[:email])
            
        @user.try(:authenticate, params[:password])

        if @user
            if @user.try(:authenticate, params[:password])
                flash[:notice] = ["Successfully logged in."]
                
                session[:user_id] = @user.id

                return redirect_to @user
            end

            flash[:errors] << "Incorrect password"
        else
            flash[:errors] << "Email not found"
        end 

        return redirect_to '/login'
    end

    def destroy
        session.clear

        flash[:notice] = ["Successfully Logged Out"]

        return redirect_to '/login'
    end
end
