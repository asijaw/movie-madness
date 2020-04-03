class UserController < ApplicationController
    get "/user/login" do
        if logged_in? 
            redirect "/user/#{current_user.id}"
        else
            erb :'/user/login'
        end 
      end
    
      post "/user/login" do 
        @user = User.find_by(name: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/user/#{@user.id}"
        else
            redirect "/user/login"
        end 
      end 
    
      get "/user/signup" do
        if logged_in? 
            redirect "/user/#{current_user.id}"
        else
            erb :'user/signup'
        end
      end 
    
      post "/user/signup" do
        if params[:username].empty? && params[:password].empty?
            flash[:alert] = "Please enter all required fields"
            redirect "/user/signup"
        elsif params[:password].length < 6
            flash[:alert] = "Password must be at least 6 characters long"
            redirect "/user/signup"
        elsif User.find_by(name: params[:username])
            flash[:alert] = "Username is taken, please login or choose another username"
            redirect "/user/signup"
        else
            @user = User.create(name: params[:username], password: params[:password])
            session[:user_id] = @user.id 
            redirect "/user/#{@user.id}"
        end 
      end

      get '/user/:id' do
        @user = User.find_by(params[:id])
        erb :'/user/account'
      end 

      get '/logout' do
        session.clear
        redirect '/user/login'
      end 
    
    end
