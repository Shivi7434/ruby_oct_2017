class OrganizationsController < ApplicationController
def index
    @organization = Organization.all

end

def create
    @organization = Organization.create(organization_params)
    
    if @organization.valid?
        Member.create(user: current_user, organization: @organization)
        
        return redirect_to organizations_path
    end       

    flash[:errors] = @organization.errors.full_messages

    return redirect_to :back
end
def show
    @organization = Organization.find(params[:id])
    
end 
private
    def organization_params
        params.require(:organization).permit(:name, :description).merge(user:current_user)

    end    
end
