require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

  describe "post 'create'" do
    it 'is redirects to tools index' do
      post :create, tool: {img: "blah.com", name: "hoe", img: "https://placekitten.com/g/200/300", user_id: 1, availability: true}
      expect(response).to redirect_to tools_path
    end
  end

  describe "PATCH 'update'" do
    it 'redirects to the tools index' do
      tool = Tool.create(img: "blah.com", name: "hoe", img: "https://placekitten.com/g/200/300", user_id: 1)
      patch :update,  id: tool.id, tool: {img: "blah.com", name: "rake", img: "https://placekitten.com/g/200/300", user_id: 1, availability: true }
      expect(response).to redirect_to tools_path
    end

    it 'checks out available tools, making them unavailable' do
      tool = Tool.create(img: "blah.com", name: "rake", img: "https://placekitten.com/g/200/300", user_id: 1, availability: true)
      patch :update, id: tool.id, tool: {img: "blah.com", name: "rake", img: "https://placekitten.com/g/200/300", user_id: 1, availability: false }
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
