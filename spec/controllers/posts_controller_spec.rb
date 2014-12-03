require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

   describe "POST 'create'" do
     it "is successful" do
      post :create
      expect(response).to redirect_to posts_path
    end
   end
   
end
