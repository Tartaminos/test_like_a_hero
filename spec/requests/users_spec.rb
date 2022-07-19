require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(200)
    end
    it "the users title is present" do
      users = create_list(:user, 3)
      get "/users"
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    context "when it has valid parameters" do
      it "creates the user with correct attributes" do
        user_attributes = FactoryBot.attributes_for(:user)
        post "/users", params: { user: user_attributes }
        expect(User.last).to have_attributes(user_attributes)
      end
    end
  
    context "when ir has no valid parameters" do 
      it "does not create user" do
        expect{
          post "/users", params: { user: {kind: '', name: '', level: ''}}
        }.to_not change(User, :count)
      end
    end
  end
end
