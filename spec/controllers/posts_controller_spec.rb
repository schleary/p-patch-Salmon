require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

   describe "POST 'create'" do
     it "is redirects to posts index" do
       post :create, post: {title: "blah", content: "blahblah", user_id: 1}
       expect(response).to redirect_to posts_path
     end
   end

   describe "PATCH 'update'" do
     it 'is redirects to posts index' do
       post = Post.create(title: "blah", content: "blahblah", user_id: 1)
       patch :update, id: post.id, post: {title: "Blah", content: "Blahblah.", user_id: 1}
       expect(response).to redirect_to posts_path
     end
   end

   describe "GET 'show'" do
     it 'is successful' do
       post = Post.create(title: "blah", content: "blahblah", user_id: 1)
       get :show, id: post.id
       expect(response.status).to eq(200)
     end
   end

   describe "DELETE 'destroy'" do
     pending
   end

end
