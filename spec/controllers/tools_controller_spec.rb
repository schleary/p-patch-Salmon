require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

  describe "POST 'create'" do
    it 'is redirects to tools index' do
      post :create, tool: {img: "blah.com", name: "hoe"}
      expect(response).to redirect_to tools_path
    end
  end

  describe "PATCH 'update'" do
    it 'redirects to the tools index' do
      tool = Tool.create(img: "blah", name: "me")
      patch :update,  id: tool.id, tool: { img: "blah.com", name: "hoe" }
      expect(response).to redirect_to tools_path
    end

    it 'checks out available tools, making them unavailable' do
      tool = Tool.create(img: "blah", name: "me")
      patch :update, id: tool.id, tool: { availability: false, person_id: 1 }
      expect(Tool.find(tool.id).availability).to eq(false)
      # This is insane.
    end

    it 'returns checked out tools, and makes them available' do
      tool = Tool.create(img: "blah", name: "me", availability: false, person_id: 1)
      patch :update, id: tool.id, tool: {availability: true, person_id: nil}
      expect(Tool.find(tool.id).availability).to eq(true)
    end
  end

  # describe "PATCH 'update'" do
  #   it 'is redirects to tools index' do
  #     tool = tool.create(img: "blah", name: "blahblah")
  #     patch :update, id: tool.id, tool: {title: "Blah", content: "Blahblah.", user_id: 1}
  #     expect(response).to redirect_to tools_path
  #   end
  # end
  #
  # describe "GET 'show'" do
  #   it 'is successful' do
  #     tool = tool.create(title: "blah", content: "blahblah", user_id: 1)
  #     get :show, id: tool.id
  #     expect(response.status).to eq(200)
  #   end
  # end

  describe "DELETE 'destroy'" do
    pending
  end


end
