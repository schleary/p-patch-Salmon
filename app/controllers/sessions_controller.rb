class SessionsController < ApplicationController
  def new
    create
  end

  def create
    auth_hash = request.env['omniauth.auth']
    puts "********"
    puts auth_hash.inspect

    @user = User.find_by_uid(auth_hash.uid)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = ENV['TWITTER_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
      #search settings hash items info user
      email = client.user_info(auth_hash.uid)
      raise "arrgg"
      @user = User.create(uid: auth_hash.uid, name: auth_hash.info.name, email: auth_hash['email'])
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
