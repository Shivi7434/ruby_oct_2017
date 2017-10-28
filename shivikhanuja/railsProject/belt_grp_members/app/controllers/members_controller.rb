class MembersController < ApplicationController
        
    def create
        organization = Organization.find(params[:member][:organization_id])
        Member.create(member_params) unless organization.members.include? current_user

        return redirect_to organizations_path
    end

    def destroy
        # @organization = Organization.find(params[:id])
        
        # @organization.destroy
 
        # return redirect_to organizations_path
    end 
        
    private
        def member_params
            params.require(:member).permit(:organization_id).merge(user: current_user)
        end    

end
