require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

  describe "post 'create'" do
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
      patch :update, id: tool.id, tool: { availability: false, user_id: 1 }
      expect(Tool.find(tool.id).availability).to eq(false)
      # This is insane.
    end

    it 'returns checked out tools, and makes them available' do
      tool = Tool.create(img: "blah", name: "me", availability: false, user_id: 1)
      patch :update, id: tool.id, tool: {availability: true, user_id: nil}
      expect(Tool.find(tool.id).availability).to eq(true)
    end
  end

  describe "DELETE 'destroy'" do
    pending
  end


end
