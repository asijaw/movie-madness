class UserController < ApplicationController
    get "/login" do
        erb :login
      end
    
      post "/user/login" do 
        erb :'user/account'
      end 
    
      get "/user/signup" do
        erb :'user/signup'
      end 
    
      post "/user/signup" do
        @user = User.create(name: params[:username], password: params[:password])
        session[:user_id] = @user.id 
        redirect "/user/#{@user.id}"
      end

      post '/user/:id' do
        @user = User.find_by(params[:id])
        erb :'/user/account'
      end 

      get '/logout' do
        session.clear
        redirect '/user/login'
      end 
    
    end
