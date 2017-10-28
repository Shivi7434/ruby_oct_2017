class SecretsController < ApplicationController
    
        def index
            # @secrets = Secret.joins('left join likes on likes.secret_id = secrets.id').group(:id).order('count(likes.id) desc')
    
            # @secrets = Secret.all.sort { |a, b| b.likes.count <=> a.likes.count }
    
            # @secrets = Secret.includes(:likes).group(:id, 'likes.id').order('count(likes.id) desc').references(:likes)
    
            @secrets = Secret.order(likes_count: :desc, created_at: :desc)
        end
    
        def new
            return redirect_to user_path(current_user)
        end
    
        def create
            @secret = Secret.new(secret_params)
            @secret.user = current_user
    
            if @secret.save
                flash[:notice] = ["Successfully created secret"]
    
                return redirect_to user_path(current_user)
            end
    
            flash[:errors] = @secret.errors.full_messages
    
            return redirect_to :back
        end
    
        def destroy
            @secret = Secret.find(params[:id])
    
            @secret.delete if @secret.user == current_user
    
            return redirect_to user_path(current_user)
        end
    
        private
            def secret_params
                params.require(:secret).permit(:content, :user)
            end
    end
