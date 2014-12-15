require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  # describe "GET 'account'" do
  #   it "is successful" do
  #     user = User.create(name: "blah", email: "blah@blah.com", uid: 23423)
  #     get :show, id: user.id
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "POST 'account'" do
  #   it "is successful" do
  #     user = User.create(name: "blah", email: "blah@blah.com", uid: 23423)
  #     @current_user = user
  #     post :update, id: user.id
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "POST 'create'" do
  #   it 'is successful' do
  #     expect{ post :create, user: {email: 'a@b.com', name: 'Holly', uid: 2342343} }.to change(User, :count).by(1)
  #   end
  #
  #   it 'should redirect to the accounts page' do
  #     post :create, user: {email: 'a@b.com', name: 'Holly'}
  #     puts assigns.inspect
  #     expect(response).to redirect_to account_path(assigns[:user])
  #   end
  # end

  # describe "POST 'update'" do
  #   it 'can change the admin status of a user' do
  #     user = User.create(name: "blah", email: "blah@blah.com", uid: 234234, confirmed: true)
  #     patch :update, user: {admin: "1"}
  #     expect(user.admin).to eq nil
  #   end
  # end

end
