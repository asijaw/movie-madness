require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/login" do
    erb :login
  end

  post "/account" do 
    erb :account
  end 

  get "/signup" do
    erb :signup
  end 

  post "/signup" do
    User.create(name: params[:username], password: params[:password])
    erb :account
  end
end
