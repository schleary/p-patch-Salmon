require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

   describe "POST 'create'" do
     it "is redirects to posts index" do
       post :create, post: {title: "blah", content: "blahblah", author: "Holly", img: "https://placekitten.com/g/200/300"}
       expect(response).to redirect_to posts_path
     end
   end

   describe "PATCH 'update'" do
     it 'is redirects to posts index' do
       post = Post.create(title: "blah", content: "blahblah", img: "https://placekitten.com/g/200/300", author: "Holly")
       patch :update, id: post.id, post: {title: "blah", content: "blahblah", img: "https://placekitten.com/g/200/300", author: "Maria"}
       expect(response).to redirect_to posts_path
     end
   end

   describe "GET 'show'" do
     it 'is successful' do
       post = Post.create(title: "blah", content: "blahblah", img: "https://placekitten.com/g/200/300", author: "Holly")
       get :show, id: post.id
       expect(response.status).to eq(200)
     end
   end

   describe "DELETE 'destroy'" do
     pending
   end

end
