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

  describe "POST 'create'" do
    it 'is successful' do
      expect{ post :create, user: {email: 'a@b.com', name: 'Holly', password: '12345' } }.to change(User, :count).by(1)
    end

    it 'should redirect to the accounts page' do
      post :create, user: {email: 'a@b.com', name: 'Holly', password: '12345'}
      puts assigns.inspect
      expect(response).to redirect_to account_path(assigns[:user])
    end
  end

  describe "POST 'update'" do
    it 'should change the admin status of a user' do
      pending
    end
  end

end
