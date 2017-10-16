require 'rails_helper'

RSpec.describe User, type: :model do
    context "has valid attributes" do
        before(:each) do
          user =build(:user)
        end

        it "should save" do
            expect(@user).to be_valid
        end  

        it "encrypts the password" do
            expect (@user.password_digest.present?).to eq(true)
        end    
    end  

    context "has invalid attributes" do
      
          
    end
end
