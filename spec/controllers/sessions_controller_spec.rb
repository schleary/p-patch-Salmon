require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

    before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }

    describe "GET 'create'" do
      it 'sets session[:current_user]' do
        get :create
        expect(session[:current_user]).to eq assigns(:user).id
      end
    end

    describe "GET 'destroy'" do
      it 'does something' do
        pending
      end

    end

end
