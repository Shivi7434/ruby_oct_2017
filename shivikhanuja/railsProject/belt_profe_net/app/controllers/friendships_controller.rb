class FriendshipsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
    end    
    def accept
        @friendships = Friendships.new(friendship_params)
        @friendships.user != current_user

        @friendship.save
            flash[:notice] = ["You have a new Friend"]

            return redirect_to friendships_path(current_user)
    end    
   
    def destroy
        @friendships = Friendships.find(params[:id])

        @friendships.delete if @friendships.user == current_user

    end    
    private
    def friendship_params
        params.require(:friendship).permit(:friender, :friendee)
    end
end
