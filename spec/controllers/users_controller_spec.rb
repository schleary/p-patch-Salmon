require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET 'account'" do
    it "is successful" do
      get :account, id: 1
      expect(response.status).to eq(200)
    end
  end

  describe "POST 'account'" do
    it "is successful" do
      post :account, id: 1
      expect(response.status).to eq(200)
    end
  end

  describe "create new user" do
    pending
  end

end
