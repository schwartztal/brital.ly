require 'rails_helper'

describe UsersController do
  let (:user) {FactoryGirl.create :user}
  let (:attributes) {FactoryGirl.attributes_for :user}

  describe "GET registrations#new - new_user_registration" do
    before (:each) do
      new_user_registration_path
    end

    it "responds with a 200 HTTP response" do
      expect(response.status).to eq(200)
    end

  end

  # describe 'POST registrations#create - user_registration' do
  #
  #   it "registers a new user and saves them to the database" do
  #     expect{ post :create, :user => attributes}.to change{User.count}.by(1)
  #   end
  #
  #   it "redirects to the home page after registration" do
  #     post :create, :user => attributes
  #     expect(response.status).to eq(302)
  #   end
  #
  # end

  describe "GET users#show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      get :show
    end
    it "assigns the user instance variable" do
      expect(assigns(:user)).to be_a(User)
    end
  end

end
