require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #new" do 
        it "renders new user's page" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do
        let (:user_params) do {
            user: {
                username: "Pacpaco",
                password: "hotpaco69"
            }
        }
        end

        context "valid params" do 
            it "should save user in database" do
                post :create, params: user_params
                user = User.find_by(username: "Pacpaco")
                # expect(user.username).to eq("Pacpaco")
                expect(user).to eq(User.find_by(username: "Pacpaco"))
            end
                
            it "should redirect to user's show page" do
                post :create, params: user_params
                user = User.find_by(username: "Pacpaco")
                expect(response).to redirect_to(user)
            end
        end
        
        context "invalid params" do            
            it "should redirect to new user page" do
                post :create, params: { 
                    user: { 
                        username: "1337hax",
                        password: ""
                    }
                 }
                expect(response).to redirect_to(new_user_url)
            end
        end
    end

end
